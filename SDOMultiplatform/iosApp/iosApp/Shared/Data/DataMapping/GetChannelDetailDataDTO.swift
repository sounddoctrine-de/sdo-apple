//
//  GetChannelDetailDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 02/11/2022.
//

import Foundation

extension GetChannelDetailQuery.Data {
    func toEntity() throws -> ChannelDetailData {
        guard let channel = channel.first,
              let latitude = Double(channel.locationLat),
              let longitude = Double(channel.locationLong),
              let websiteUrl = URL(string: channel.websiteUrl),
              let channelType = channel.channelType
        else {
            throw BusinessErrors.parsingError()
        }
        return ChannelDetailData(
            channelId: channel.id,
            channelName: channel.channelName,
            channelType: try ChannelTypeDTO(rawValue: channelType.channelTypeCode).toEntity(),
            location: ChannelDetailData.Location(
                latitude: latitude,
                longitude: longitude
            ),
            regionCode: channel.regionCode,
            videosInChannel: try channel.videosInChannel.map {
                try $0.toEntity(
                    channelId: channel.id,
                    channelName: channel.channelName
                )
            },
            websiteUrl: websiteUrl
        )
    }
}

extension GetChannelDetailQuery.Data.Channel.VideosInChannel {
    func toEntity(channelId: String, channelName: String) throws -> ChannelDetailData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let thumbnailUrl = URL(string: thumbnailUrl),
              let datePublished = formatter.date(from: datePublished),
              let speaker = _videoSpeakers.first?.speaker,
              let videoType,
              let language
        else {
            throw BusinessErrors.parsingError()
        }
        return ChannelDetailData.Video(
            videoId: id,
            title: title,
            videoType: try VideoTypeDTO(videoType.videoTypeName).toEntity(),
            channelId: channelId,
            channelName: channelName,
            speaker: ChannelDetailData.Video.Speaker(
                speakerId: speaker.id,
                speakerName: speaker.speakerName
            ),
            language: ChannelDetailData.Video.Language(
                languageCode: language.languageCode,
                sourceCountryFlag: language.sourceCountryFlag
            ),
            thumbnailUrl: thumbnailUrl,
            description: description,
            datePublished: datePublished
        )
    }
}
