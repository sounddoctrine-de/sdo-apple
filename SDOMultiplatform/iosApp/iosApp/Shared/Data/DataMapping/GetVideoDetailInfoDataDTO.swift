//
//  GetVideoDetailInfoDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation
import ComposeApp

extension GetVideoDetailDataQuery.Data {
    func toEntity() throws -> VideoDetailData.InfoData {
        let videoDetails = videoDetail
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let videoDetail = videoDetails.first,
              let datePublished = formatter.date(from: videoDetail.datePublished),
              let thumbnailUrl = URL(string: videoDetail.thumbnailUrl),
              let speaker = videoDetail._videoSpeakers.first,
              let userLikedVideosAggregateCount = _userLikedVideosAggregate.aggregate?.count,
              let userDislikedVideosAggregateCount = _userDislikedVideosAggregate.aggregate?.count,
              let videoType = videoDetail.videoType,
              let channel = videoDetail.channel,
              let language = videoDetail.language
        else {
            throw BusinessErrors.parsingError()
        }
        let isLiked = userLikedVideosAggregateCount > 0
        let isDisliked = userDislikedVideosAggregateCount > 0
        
        return VideoDetailData.InfoData(
            videoId: videoDetail.id,
            title: videoDetail.title,
            videoType: try VideoTypeDTO(videoType.videoTypeName).toEntity(),
            datePublished: datePublished,
            description: videoDetail.description,
            speaker: speaker.toEntity(),
            channel: try channel.toEntity(),
            moreVideosInChannel: try moreVideosInChannel.map { try $0.toEntity() },
            language: language.toEntity(),
            thumbnailURL: thumbnailUrl,
            likedByUser: isLiked ? true : (isDisliked ? false : nil)
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail._VideoSpeaker {
    func toEntity() -> VideoDetailData.SpeakerData {
        return VideoDetailData.SpeakerData(
            speakerId: speaker.id,
            speakerName: speaker.speakerName
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Channel {
    func toEntity() throws -> ChannelData {
        guard let channelType else {
            throw BusinessErrors.parsingError()
        }
        return ChannelData(
            channelId: id,
            channelName: channelName,
            channelType: try channelType.toEntity()
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Channel.ChannelType {
    func toEntity() throws -> ChannelTypeData {
        switch channelTypeCode {
        case "church":
            return .church
        case "soulWinningClub":
            return .soulWinningClub
        default:
            AppLogger.error("Unexpectedly got invalid channelTypeCode: \(channelTypeCode)")
            throw BusinessErrors.parsingError()
        }
    }
}

extension GetVideoDetailDataQuery.Data.MoreVideosInChannel {
    func toEntity() throws -> VideoDetailData.RelatedVideo {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let datePublished = formatter.date(from: datePublished),
              let thumbnailUrl = URL(string: thumbnailUrl),
              let speaker = _videoSpeakers.first?.speaker,
              let channel
        else {
            throw BusinessErrors.parsingError()
        }

        return VideoDetailData.RelatedVideo(
            videoId: id,
            title: title,
            channelId: channel.id,
            channelName: channel.channelName,
            datePublished: datePublished,
            speakerName: speaker.speakerName,
            thumbnailURL: thumbnailUrl
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Language {
    func toEntity() -> LanguageData {
        return LanguageData(
            languageCode: languageCode,
            sourceCountryFlag: sourceCountryFlag
        )
    }
}

extension VideoTypeDTO {
    func toEntity() -> VideoType {
        switch self {
        case .documentary:
            return .documentary
        case .music:
            return .music
        case .sermon:
            return .sermon
        case .short:
            return .short
        case .interview:
            return .interview
        }
    }
}
