//
//  SearchResultInputData.swift
//  SDO
//
//  Created by Joel Kingsley on 01/10/2022.
//

import Foundation

struct SearchResultInputData {
    let videoType: VideoType?
    let searchText: String
    let languageCode: String?
    let limit: Int
    let page: Int
    var offset: Int {
        page*limit
    }
}
