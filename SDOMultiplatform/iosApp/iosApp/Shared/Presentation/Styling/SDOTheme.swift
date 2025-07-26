//
//  SDOTheme.swift
//  SDO
//
//  Created by Joel Kingsley on 18/08/2022.
//

import SwiftUI

enum SDOTheme {
    static func initializeTheme() {
//        for family in UIFont.familyNames {
//             AppLogger.debug(family)
//
//             for names in UIFont.fontNames(forFamilyName: family){
//                 AppLogger.debug("== \(names)")
//             }
//        }
    }
}

extension Font {
    static var sdoLargeTitle: Font {
        Font.largeTitle
    }
    
    static var sdoTitle: Font {
        Font.title
    }
    
    static var sdoTitle2: Font {
        Font.title2
    }
    
    static var sdoTitle3: Font {
        Font.title3
    }
    
    static var sdoHeadline: Font {
        Font.headline
    }
    
    static var sdoBody: Font {
        Font.body
    }
    
    static var sdoSubHeadline: Font {
        Font.subheadline
    }
    
    static var sdoCallout: Font {
        Font.callout
    }
    
    static var sdoFootnote: Font {
        Font.footnote
    }
    
    static var sdoCaption: Font {
        Font.caption
    }
    
    static var sdoCaption2: Font {
        Font.caption2
    }
    
    static var customTitle: Font {
        Font.custom("Futura", size: 25, relativeTo: .title)
    }
}
