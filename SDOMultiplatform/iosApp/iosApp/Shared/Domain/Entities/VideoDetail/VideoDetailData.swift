//
//  VideoDetailData.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import Foundation
import ComposeApp

struct VideoDetailData {
    struct SpeakerData {
        let speakerId: String
        let speakerName: String
    }
    
    struct RelatedVideo: Identifiable, ThumbnailableVideo {
        var id: UUID {
            return UUID(uuidString: videoId) ?? UUID()
        }
        
        let videoId: String
        let title: String
        let channelId: String
        let channelName: String
        let datePublished: Date
        let speakerName: String
        let thumbnailURL: URL
    }
    
    struct InfoData {
        let videoId: String
        let title: String
        let videoType: VideoType
        let datePublished: Date
        let description: String
        let speaker: SpeakerData
        let channel: ChannelData
        let moreVideosInChannel: [RelatedVideo]
        let language: LanguageData
        let thumbnailURL: URL
        
        /// Whether video is liked or dislike by user (`nil` if neither)
        var likedByUser: Bool?
    }
    
    var infoData: InfoData
    let videoUrl: URL?
    
    let subscriptionVideoBelongsTo: SubscriptionData?
    let allAccessSubscription: SubscriptionData?
    
    var isVideoAccessibleToUser: Bool {
        // TODO: Check if user is subscribed to `subscriptionVideoBelongsTo` or `allAccessSubscription`
        guard subscriptionVideoBelongsTo != nil else {
            return true
        }
        return true
    }
}

extension VideoDetailData: TopPreviewableVideo {
    var likedByUser: Bool? {
        get {
            infoData.likedByUser
        }
        set {
            infoData.likedByUser = newValue
        }
    }
    
    var videoId: String {
        infoData.videoId
    }
    
    var title: String {
        infoData.title
    }
    
    var thumbnailURL: URL {
        infoData.thumbnailURL
    }
    
    var datePublished: Date {
        infoData.datePublished
    }
    
    var description: String {
        infoData.description
    }
    
    var canUserWatch: Bool {
        return isVideoAccessibleToUser && videoUrl != nil
    }
    
    var subscriptionForWatching: SubscriptionData? {
        return subscriptionVideoBelongsTo
    }

    var speakerName: String {
        return infoData.speaker.speakerName
    }
    
    var localizedType: String {
        let type = infoData.videoType.localizedString()
        return type
    }
    
    var signedUrl: URL? {
        return videoUrl
    }
}

extension VideoDetailData: PlayableVideo {
    var channelName: String {
        return infoData.channel.channelName
    }
}
