//
//  VideoInChannelRow.swift
//  SDO
//
//  Created by Joel Kingsley on 02/11/2022.
//

import SwiftUI

struct VideoInChannelRow: View {
    let video: ChannelDetailData.Video
    @State var thumbnailWidth: CGFloat = 0
    
    init(video: ChannelDetailData.Video) {
        self.video = video
        AppLogger.initLog()
    }

    var body: some View {
        HStack {
            NavigationLink {
                VideoDetailView(
                    videoId: video.videoId,
                    channelId: video.channelId
                )
            } label: {
                HStack {
                    Spacer()
                        .frame(width: 20)
                    VideoThumbnail(video: video, style: .xsmall, thumbnailWidth: $thumbnailWidth)
                        .frame(width: thumbnailWidth)
                    VStack {
                        HStack {
                            Text(video.title)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                            Spacer()
                        }
                        HStack {
                            Text("\(video.videoType.localizedString()) · \(video.channelName)")
                                .lineLimit(1)
                                .font(.sdoCaption)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Spacer()
                        }
                    }
                    Spacer()
                    Spacer()
                        .frame(width: 20)
                    
                }
            }
        }
    }
}

struct VideoInChannelRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoInChannelRow(
            video: ChannelDetailData.Video(
                videoId: exampleVideoDetail1.videoId,
                title: exampleVideoDetail1.title,
                videoType: .documentary,
                channelId: exampleVideo1.channelId,
                channelName: exampleVideoDetail1.channelName,
                speaker: ChannelDetailData.Video.Speaker(
                    speakerId: "",
                    speakerName: exampleVideoDetail1.speakerName
                ),
                language: ChannelDetailData.Video.Language(
                    languageCode: "en",
                    sourceCountryFlag: "🇬🇧"
                ),
                thumbnailUrl: exampleVideoDetail1.thumbnailURL,
                description: exampleVideoDetail1.description,
                datePublished: exampleVideoDetail1.datePublished
            )
        )
    }
}
