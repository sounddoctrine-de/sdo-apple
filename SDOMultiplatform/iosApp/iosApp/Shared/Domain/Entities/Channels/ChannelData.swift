//
//  ChannelData.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation

struct ChannelData {
    let channelId: String
    let channelName: String
    let channelType: ChannelTypeData
    
    func descriptionString() -> String {
        return "Channel ID: \(channelId), Channel Name: \(channelName), Channel Type: \(channelType.rawValue)"
    }
    
    func isChurch() -> Bool {
        channelType == ChannelTypeData.church
    }
    
    func isSoulWinningClub() -> Bool {
        channelType == ChannelTypeData.soulWinningClub
    }
    
    func channelNameInAllCaps() -> String {
        channelName.uppercased()
    }
}

enum ChannelTypeData: String {
    case church = "channelsTypeChurchLabel"
    case soulWinningClub = "channelsTypeSoulWinningLabel"
    
    func localizedString() -> String {
        return String(localized: String.LocalizationValue(self.rawValue))
    }
}
