//
//  SearchResultViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 01/10/2022.
//

import SwiftUI
import Combine
import ComposeApp

@MainActor
class SearchResultViewModel: ObservableObject {
    private let getVideosOfSearchParametersUseCase = GetVideosOfSearchParametersUseCase(
        videoRepository: HasuraVideoRepository(
            graphQLService: HasuraGraphQLService()))
    
    private let getAllLanguagesUseCase = GetAllLanguagesUseCase(
        languageRepository: HasuraLanguageRepository(
            graphQLService: HasuraGraphQLService()))
    
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Search parameters
    
    /// The current search text
    @Published var searchText: String
    
    /// The current selected search result item type
    @Published var selectedSearchResultItemType: SearchResultItemType
    
    /// The current selected search result language code
    @Published var selectedSearchResultLanguage: LanguageData
    
    /// Constant to denote how many videos to fetch at a time
    private let pageLimit = 1000
    
    // MARK: - Api data and view state
    
    /// Whether page loaded with initial data
    @Published var isPageLoaded: Bool = false
    
    /// The fetched videos for the current search parameters
    @Published var searchResultVideos: [SearchResultData.Video] = []
    
    /// Total number of videos available in the backend for current search parameters
    @Published var totalAvailableVideosForSearchResult: Int = 0
    
    /// Whether error occurred while loading initial data
    @Published var errorOccurred: BusinessError? = nil
    
    /// The last page of videos loaded for the current search parameters
    @Published var highestLoadedPage: Int = -1
    
    /// Whether more videos are being loaded for the current search parameters
    @Published var isLoadingMoreVideos: Bool = false
    
    /// All language codes
    @Published var allLanguages: [LanguageData] = []
    
    // MARK: - Lifecycle
    
    init(
        searchResultItemType: SearchResultItemType,
        searchText: String?,
        language: LanguageData
    ) {
        self.selectedSearchResultItemType = searchResultItemType
        self.searchText = searchText ?? ""
        self.selectedSearchResultLanguage = language
    }
    
    // MARK: - Methods
    
    func onLoaded() {
        Task { [weak self] in
            guard let self = self else { return }
            switch await getAllLanguagesUseCase.execute() {
            case let .success(data):
                self.allLanguages = [
                    LanguageData.Companion().invoke()
                ]
                self.allLanguages.append(contentsOf: data)
            default:
                break
            }
            
            self.$selectedSearchResultItemType.sink { [weak self] searchResultItemType in
                guard let self = self else { return }
                self.isPageLoaded = false
                Task {
                    await self.loadInitialVideos(
                        ofItemType: searchResultItemType,
                        ofLanguage: self.selectedSearchResultLanguage
                    )
                }
            }.store(in: &cancellables)
            
            self.$selectedSearchResultLanguage.sink { [weak self] searchResultLanguage in
                guard let self = self else { return }
                self.isPageLoaded = false
                Task {
                    await self.loadInitialVideos(
                        ofItemType: self.selectedSearchResultItemType,
                        ofLanguage: searchResultLanguage
                    )
                }
            }
            .store(in: &cancellables)
        }
    }
    
    func onSearchTextSubmitted() {
        isPageLoaded = false
        Task {
            await self.loadInitialVideos(
                ofItemType: selectedSearchResultItemType,
                ofLanguage: selectedSearchResultLanguage
            )
        }
    }

    /// Invoked when last video scrolled to in search results
    func onLastVideoReached() {
        // TODO: Removed from usage. Infinite list implementation to be fixed.
        Task {
            if totalAvailableVideosForSearchResult > searchResultVideos.count {
                isLoadingMoreVideos = true
                switch await getVideosForSearchParameters(
                    itemType: selectedSearchResultItemType,
                    language: selectedSearchResultLanguage,
                    searchText: searchText
                ) {
                case let .success(data):
                    var updatedVideos = self.searchResultVideos
                    updatedVideos.append(contentsOf: data.videos)
                    self.searchResultVideos = updatedVideos
                    self.highestLoadedPage = self.highestLoadedPage + 1
                case let .failure(error):
                    AppLogger.debug("Error occurred while loading more videos: \(error)")
                }
                isLoadingMoreVideos = false
            }
        }
    }
    
    private func resetSearchResults() {
        self.searchResultVideos = []
        self.totalAvailableVideosForSearchResult = 0
        self.errorOccurred = nil
        self.highestLoadedPage = -1
    }
    
    private func loadInitialVideos(
        ofItemType itemType: SearchResultItemType,
        ofLanguage language: LanguageData
    ) async {
        self.resetSearchResults()
        switch await self.getVideosForSearchParameters(
            itemType: itemType,
            language: language,
            searchText: self.searchText
        ) {
        case let .success(data):
            self.searchResultVideos = data.videos
            self.totalAvailableVideosForSearchResult = data.totalNumberOfVideos
            self.errorOccurred = nil
            self.highestLoadedPage = 0
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
            self.searchResultVideos = []
            self.totalAvailableVideosForSearchResult = 0
            self.errorOccurred = error
            self.highestLoadedPage = -1
        }
        self.isPageLoaded = true
    }
    
    private func getVideosForSearchParameters(
        itemType: SearchResultItemType,
        language: LanguageData,
        searchText: String
    ) async -> Result<SearchResultData, BusinessError> {
        let videoType = VideoType(searchResultItemType: selectedSearchResultItemType)
        let languageCode = (language.languageCode.isEmpty) ? nil : language.languageCode
        return await getVideosOfSearchParametersUseCase.execute(
            searchResultInputData: SearchResultInputData(
                videoType: videoType,
                searchText: searchText,
                languageCode: languageCode,
                limit: pageLimit,
                page: highestLoadedPage + 1
            )
        )
    }
}

extension VideoType {
    init?(searchResultItemType: SearchResultItemType) {
        switch searchResultItemType {
        case .all:
            self.init(rawValue: "")
        case .sermons:
            self = .sermon
        case .documentaries:
            self = .documentary
        case .shorts:
            self = .short
        case .music:
            self = .music
        case .interviews:
            self = .interview
        }
    }
}
