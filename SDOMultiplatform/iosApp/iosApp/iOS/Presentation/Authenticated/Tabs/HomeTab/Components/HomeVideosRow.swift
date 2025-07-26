//
//  HomeVideosRow.swift
//  SDO
//
//  Created by Joel Kingsley on 19/08/2022.
//

import SwiftUI
import ComposeApp

struct HomeVideosRow: View {
    let title: LocalizedStringKey
    let videoThumbnailStyle: VideoThumbnailStyle
    let videos: [HomeScreenData.HomeVideo]
    let showAllItemType: SearchResultItemType
    let videoThumbnailsRowViewModel = VideoThumbnailsRowViewModel()
    
    @State var thumbnailWidth: CGFloat = 0
    @State var showResultView: Bool = false
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(uiColor: .systemBackground), Color(uiColor: .systemGray).opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack {
                HStack {
                    Text(title)
                        .font(.sdoTitle2)
                        .bold()
                    Spacer()
                    NavigationLink(value: showAllItemType) {
                        Text("homeShowAllLabel")
                            .padding(.trailing, 20)
                    }
                }
                .padding(.leading, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(videos) { video in
                            NavigationLink(value: video) {
                                VStack {
                                    VideoThumbnail(video: video, style: videoThumbnailStyle, thumbnailWidth: $thumbnailWidth)
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
                                                .lineLimit(2, reservesSpace: true)
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
        .navigationDestination(for: HomeScreenData.HomeVideo.self) { video in
            VideoDetailView(
                videoId: video.videoId,
                channelId: video.channelId,
                path: $path
            )
        }
    }
}

struct HomeVideosRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeVideosRow(
            title: "",
            videoThumbnailStyle: .small,
            videos: [exampleVideo1, exampleVideo2],
            showAllItemType: .documentaries,
            path: Binding.constant(NavigationPath())
        )
    }
}
