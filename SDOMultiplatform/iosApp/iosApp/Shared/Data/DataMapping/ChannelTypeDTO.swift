//
//  ChannelTypeDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 20/02/2023.
//

import Foundation

enum ChannelTypeDTO: String {
    case soulWinningClub
    case church
    
    init(rawValue: String) throws {
        switch rawValue {
        case "soulWinningClub":
            self = .soulWinningClub
        case "church":
            self = .church
        default:
            AppLogger.error("Unexpectedly got invalid option for ChannelTypeDTO: \(rawValue)")
            throw BusinessErrors.parsingError()
        }
    }
    
    init(channelType: ChannelTypeData) {
        switch channelType {
        case .church:
            self = .church
        case .soulWinningClub:
            self = .soulWinningClub
        }
    }
    
    func toEntity() -> ChannelTypeData {
        switch self {
        case .soulWinningClub:
            return .soulWinningClub
        case .church:
            return .church
        }
    }
}
