//
//  ChannelDetailData.swift
//  SDO
//
//  Created by Joel Kingsley on 02/11/2022.
//

import Foundation

struct ChannelDetailData {
    struct Location {
        let latitude: Double
        let longitude: Double
    }
    
    struct Video: Identifiable {
        struct Speaker: Equatable {
            let speakerId: String
            let speakerName: String
        }
        
        struct Language: Equatable {
            let languageCode: String
            let sourceCountryFlag: String
            
            var languageName: String {
                return Locale.current.localizedString(forLanguageCode: languageCode) ?? "N/A"
            }
        }
        
        var id: UUID {
            UUID(uuidString: videoId) ?? UUID()
        }
        
        let videoId: String
        let title: String
        let videoType: VideoType
        let channelId: String
        let channelName: String
        let speaker: Speaker
        let language: Language
        let thumbnailUrl: URL
        let description: String
        let datePublished: Date
    }
    
    let channelId: String
    let channelName: String
    let channelType: ChannelTypeData
    let location: Location
    let regionCode: String
    let videosInChannel: [Video]
    let websiteUrl: URL
}

extension ChannelDetailData.Video: ThumbnailableVideo {
    var thumbnailURL: URL {
        thumbnailUrl
    }
    
    var speakerName: String {
        speaker.speakerName
    }
    
    
}
