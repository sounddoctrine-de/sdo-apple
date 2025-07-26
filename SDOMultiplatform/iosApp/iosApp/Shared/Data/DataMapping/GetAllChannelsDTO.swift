//
//  GetAllChannelsDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

extension GetAllChannelsQuery.Data {
    func toEntity() throws -> GetChannelsData {
        return GetChannelsData(
            channels: try channel.map { try $0.toEntity() }
        )
    }
}

extension GetAllChannelsQuery.Data.Channel {
    func toEntity() throws -> GetChannelsData.ChannelData {
        guard let latitude = Double(locationLat),
              let longitude = Double(locationLong),
              let channelType
        else {
            throw BusinessErrors.parsingError()
        }
        return GetChannelsData.ChannelData(
            channelId: id,
            channelName: channelName,
            type: try ChannelTypeDTO(rawValue: channelType.channelTypeCode).toEntity(),
            location: GetChannelsData.ChannelData.Location(
                latitude: latitude,
                longitude: longitude
            ),
            regionCode: regionCode,
            addressText: addressText
        )
    }
}
