//
//  SearchTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/08/2022.
//

import Foundation
import ComposeApp

@MainActor
class SearchTabViewModel: ObservableObject {
    private let getAllLanguagesUseCase = GetAllLanguagesUseCase(
        languageRepository: HasuraLanguageRepository(
            graphQLService: HasuraGraphQLService()))
    
    @Published var languages: [LanguageData] = []
    
    @Published var onPageLoaded = false
    
    func onLoaded() {
        Task { [weak self] in
            guard let self = self else { return }
            switch await getAllLanguagesUseCase.execute() {
            case let .success(data):
                self.languages = data
            default:
                break
            }
            onPageLoaded = true
        }
    }
}
