//
//  ChannelDetailView.swift
//  SDO
//
//  Created by Joel Kingsley on 01/11/2022.
//

import SwiftUI
import SafariServices

struct ChannelDetailView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var channelDetailViewModel: ChannelDetailViewModel
    @State var showWebsite: Bool = false
    
    init(channelId: String?) {
        self.channelDetailViewModel = ChannelDetailViewModel(channelId: channelId)
        AppLogger.initLog()
    }
    
    var body: some View {
        if channelDetailViewModel.channelId == nil {
            CustomErrorView(
                error: BusinessErrors.clientError(),
                authViewModel: authViewModel) {
                    channelDetailViewModel.onLoaded()
                }
        } else if let channelDetailData = channelDetailViewModel.channelDetailData {
            switch channelDetailData {
            case let .success(data):
                VStack {
                    Text(data.channelName)
                        .font(.sdoTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    HStack {
                        Text(channelDetailViewModel.getChannelInfoString(channel: data))
                    }
                    
                    HStack {
                        Button {
                            channelDetailViewModel.onOpenInMapPressed(channel: data)
                        } label: {
                            VStack {
                                Image(systemName: "map")
                                Text("channelDetailOpenInMapLabel")
                            }
                        }
                        .padding()
                        
                        Button {
                            showWebsite = true
                        } label: {
                            VStack {
                                Image(systemName: "link")
                                Text("channelDetailOpenWebsiteLabel")
                            }
                        }
                        .padding()
                    }
                    
                    if data.videosInChannel.isEmpty {
                        Text("channelDetailNoVideosInChannelLabel")
                            .font(.sdoCaption)
                        Spacer()
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(data.videosInChannel) { video in
                                    VideoInChannelRow(video: video)
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $showWebsite) {
                    SafariView(url: data.websiteUrl)
                }
            case let .failure(error):
                CustomErrorView(
                    error: error,
                    authViewModel: authViewModel
                )
            }
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    channelDetailViewModel.onLoaded()
                }
        }
    }
}

struct ChannelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelDetailView(channelId: "")
    }
}
