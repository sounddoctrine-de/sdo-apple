//
//  MoreVideosInChannelRow.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import SwiftUI

struct MoreVideosInChannelRow: View {
    let channelName: String
    let videos: [VideoDetailData.RelatedVideo]
    @State var thumbnailWidth: CGFloat = 0
    let videoThumbnailsRowViewModel = VideoThumbnailsRowViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text(String(localized: String.LocalizationValue("videoDetailMoreVideosInChannelLabel")) + " \(channelName)")
                    .font(.sdoTitle2)
                    .bold()
                Spacer()
            }
            .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(videos) { video in
                        NavigationLink {
                            VideoDetailView(videoId: video.videoId, channelId: video.channelId)
                        } label: {
                            VStack {
                                VideoThumbnail(video: video, style: .small, thumbnailWidth: $thumbnailWidth)
                                Group {
                                    HStack {
                                        Text(video.title)
                                            .font(.sdoCallout)
                                            .lineLimit(1)
                                            .foregroundColor(Color(uiColor:UIColor.label))
                                        Spacer()
                                    }
                                    HStack {
                                        Text(videoThumbnailsRowViewModel.getThumbnailDescription(ofVideo: video))
                                            .lineLimit(2)
                                            .multilineTextAlignment(.leading)
                                            .font(.sdoFootnote)
                                            .foregroundColor(Color(uiColor:UIColor.secondaryLabel))
                                        Spacer()
                                    }
                                }
                                .frame(width: thumbnailWidth)
                                Spacer()
                                    .frame(height: 20)
                            }
                        }
                    }
                    Spacer()
                        .frame(width: 20)
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct MoreVideosInChannelRow_Previews: PreviewProvider {
    static var previews: some View {
        MoreVideosInChannelRow(
            channelName: exampleVideoDetail1.channelName,
            videos: exampleVideoDetail1.infoData.moreVideosInChannel
        )
    }
}
