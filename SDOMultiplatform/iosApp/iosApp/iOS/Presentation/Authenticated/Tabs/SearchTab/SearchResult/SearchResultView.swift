//
//  SearchResultView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 01/10/2022.
//

import SwiftUI
import ComposeApp

struct SearchResultView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var searchResultViewModel: SearchResultViewModel
    @Binding var path: NavigationPath
    
    init(
        ofItemType itemType: SearchResultItemType,
        searchText: String? = nil,
        language: LanguageData,
        path: Binding<NavigationPath>
    ) {
        self.searchResultViewModel = SearchResultViewModel(
            searchResultItemType: itemType,
            searchText: searchText,
            language: language
        )
        self._path = path
        AppLogger.initLog()
    }
    
    var body: some View {
        Group {
            if let error = searchResultViewModel.errorOccurred {
                CustomErrorView(
                    error: error,
                    authViewModel: authViewModel,
                    tryAgainHandler: {
                        searchResultViewModel.onLoaded()
                    }
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("searchResultsScreenNavigationTitle")
            } else if searchResultViewModel.isPageLoaded {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        Picker("SearchResultItemTypes", selection: $searchResultViewModel.selectedSearchResultItemType) {
                            ForEach(SearchResultItemType.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom)
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                                .frame(width: 20)
                            Text("Filter by Language Code:")
                            Picker("Languages", selection: $searchResultViewModel.selectedSearchResultLanguage) {
                                ForEach(searchResultViewModel.allLanguages, id: \.self) { option in
                                    Text("\(option.sourceCountryFlag) \(option.languageName)")
                                }
                            }
                            .pickerStyle(.automatic)
                            Spacer()
                        }
                        
                        ForEach(searchResultViewModel.searchResultVideos) { video in
                            SearchResultRow(video: video, path: $path)
                        }
                        .padding(.leading, 20)
                    }
                    .searchable(
                        text: $searchResultViewModel.searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "searchResultsSearchLabel"
                    )
                    .textInputAutocapitalization(.never)
                    .onSubmit(of: .search) {
                        searchResultViewModel.onSearchTextSubmitted()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("searchResultsScreenNavigationTitle")
                }
            } else {
                ProgressView("progressViewLoadingLabel")
                    .progressViewStyle(.circular)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("searchResultsScreenNavigationTitle")
            }
        }
        .onAppear {
            searchResultViewModel.onLoaded()
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(ofItemType: .all, language: LanguageData.Companion().invoke(), path: Binding.constant(NavigationPath()))
    }
}
