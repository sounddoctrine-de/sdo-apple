//
//  SearchQueryData.swift
//  iosApp
//
//  Created by Joel Kingsley Rangarajan on 25.07.25.
//

import Foundation
import ComposeApp

struct SearchQueryData: Hashable {
    let itemType: SearchResultItemType
    let searchText: String?
    let language: LanguageData
}

extension SearchQueryData {
    init(itemType: SearchResultItemType, language: LanguageData) {
        self.init(itemType: itemType, searchText: "", language: language)
    }
}
