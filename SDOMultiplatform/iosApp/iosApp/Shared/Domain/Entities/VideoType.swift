//
//  VideoType.swift
//  SDO
//
//  Created by Joel Kingsley on 01/10/2022.
//

import Foundation

enum VideoType: String, Equatable {
    case sermon = "videoDetailVideoTypeSermon"
    case documentary = "videoDetailVideoTypeDocumentary"
    case short = "videoDetailVideoTypeShort"
    case music = "videoDetailVideoTypeMusic"
    case interview = "videoDetailVideoTypeInterview"
    
    func localizedString() -> String {
        return String(localized: String.LocalizationValue(self.rawValue))
    }
}
