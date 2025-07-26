//
//  GetVideosOfSearchParametersDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 06/10/2022.
//

import Foundation

extension GetVideosForSearchTextQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videoAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try video.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = URL(string: thumbnailUrl),
              let speaker = _videoSpeakers.first?.speaker,
              let channel,
              let videoType
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: id,
            title: title,
            channelId: channel.id,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try VideoTypeDTO(videoType.videoTypeName).toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
}

extension GetVideosForSearchTextAndVideoTypeQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videoAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try video.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextAndVideoTypeQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = URL(string: thumbnailUrl),
              let channel,
              let speaker = _videoSpeakers.first?.speaker,
              let videoType
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: id,
            title: title,
            channelId: channel.id,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try VideoTypeDTO(videoType.videoTypeName).toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
}

extension GetVideosForSearchTextVideoTypeAndLanguageCodeQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videoAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try video.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextAndLanguageCodeQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videoAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try video.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextAndLanguageCodeQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = URL(string: thumbnailUrl),
              let channel,
              let speaker = _videoSpeakers.first?.speaker,
              let videoType
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: id,
            title: title,
            channelId: channel.id,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try VideoTypeDTO(videoType.videoTypeName).toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
}

extension GetVideosForSearchTextVideoTypeAndLanguageCodeQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = URL(string: thumbnailUrl),
              let channel,
              let speaker = _videoSpeakers.first?.speaker,
              let videoType
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: id,
            title: title,
            channelId: channel.id,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try VideoTypeDTO(videoType.videoTypeName).toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
}
