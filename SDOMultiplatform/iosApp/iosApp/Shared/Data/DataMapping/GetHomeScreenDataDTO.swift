//
//  GetHomeScreenDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 25/08/2022.
//

import Foundation

extension GetHomeScreenDataQuery.Data {
    func toEntity() throws -> HomeScreenData {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        let documentaryVideos = try documentaries.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = URL(string: video.thumbnailUrl),
                  let speaker = video._videoSpeakers.first?.speaker,
                  let channel = video.channel
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.id,
                title: video.title,
                channelId: channel.id,
                channelName: channel.channelName,
                datePublished: datePublished,
                speakerName: speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }
        
        let sermonVideos = try sermons.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = URL(string: video.thumbnailUrl),
                  let speaker = video._videoSpeakers.first?.speaker,
                  let channel = video.channel
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.id,
                title: video.title,
                channelId: channel.id,
                channelName: channel.channelName,
                datePublished: datePublished,
                speakerName: speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }
        
        let shortVideos = try shorts.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = URL(string: video.thumbnailUrl),
                  let speaker = video._videoSpeakers.first?.speaker,
                  let channel = video.channel
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.id,
                title: video.title,
                channelId: channel.id,
                channelName: channel.channelName,
                datePublished: datePublished,
                speakerName: speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }

        let music = try musicVideos.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = URL(string: video.thumbnailUrl),
                  let channel = video.channel,
                  let speaker = video._videoSpeakers.first?.speaker
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.id,
                title: video.title,
                channelId: channel.id,
                channelName: channel.channelName,
                datePublished: datePublished,
                speakerName: speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }
        
        let interviewVideos = try interviews.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = URL(string: video.thumbnailUrl),
                  let channel = video.channel,
                  let speaker = video._videoSpeakers.first?.speaker
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.id,
                title: video.title,
                channelId: channel.id,
                channelName: channel.channelName,
                datePublished: datePublished,
                speakerName: speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }


        return HomeScreenData(
            documentaries: documentaryVideos,
            sermons: sermonVideos,
            shorts: shortVideos,
            musicVideos: music,
            interviews: interviewVideos
        )
    }
}
