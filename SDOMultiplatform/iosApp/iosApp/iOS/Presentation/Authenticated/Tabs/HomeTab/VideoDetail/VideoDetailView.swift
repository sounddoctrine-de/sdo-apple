//
//  VideoDetailView.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import SwiftUI

struct VideoDetailView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var videoDetailViewModel: VideoDetailViewModel
    
    init(videoId: String, channelId: String) {
        self.videoDetailViewModel = VideoDetailViewModel(videoId: videoId, channelId: channelId)
        AppLogger.initLog()
    }

    var body: some View {
        if let videoDetailData = videoDetailViewModel.videoDetailData {
            switch videoDetailData {
            case let .success(data):
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        TopVideoPreview(video: data)

                        Divider()
                            .padding(.horizontal, 20)

                        if !data.infoData.moreVideosInChannel.isEmpty {
                            MoreVideosInChannelRow(
                                channelName: data.infoData.channel.channelName,
                                videos: data.infoData.moreVideosInChannel
                            )
                        }

                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .navigationTitle(data.infoData.title)
                .navigationBarTitleDisplayMode(.inline)
            case let .failure(error):
                CustomErrorView(
                    error: error,
                    authViewModel: authViewModel) {
                        videoDetailViewModel.onLoaded(user: authViewModel.getUser())
                    }
            }
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    videoDetailViewModel.onLoaded(user: authViewModel.getUser())
                }
        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(videoId: "", channelId: "")
    }
}
