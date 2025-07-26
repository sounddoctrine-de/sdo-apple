//
//  TopVideoPreviewActionButtonList.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 26/10/2022.
//

import SwiftUI

struct TopVideoPreviewActionButtonList: View {
    @EnvironmentObject var topVideoPreviewViewModel: TopVideoPreviewViewModel
    @State var showVideoPlayerView: Bool = false
    
    var body: some View {
        VStack {
            if topVideoPreviewViewModel.video.canUserWatch && topVideoPreviewViewModel.video.signedUrl != nil {
                HStack {
                    Spacer()
                    
                    ActionButton(
                        imageName: "play.fill",
                        customFont: .sdoTitle2, text: "videoDetailPlayButtonLabel") {
                            topVideoPreviewViewModel.resetAndPlayVideo()
                            showVideoPlayerView = true
                    }
                    .frame(width: 250)

                    NavigationLink(isActive: $showVideoPlayerView) {
                        VideoPlayerView(video: topVideoPreviewViewModel.video)
                    } label: {
                        EmptyView()
                    }

                    Spacer()
                }
            } else {
                if let subscription = topVideoPreviewViewModel.video.subscriptionForWatching {
                    HStack {
                        Spacer()
                        VStack {
                            ActionButton(customFont: .sdoCallout, text: subscription.localizedSubscribeButtonText) {
                                // TODO: Subscribe user to given subscription
                            }
                            .frame(width: 250)
                            Text(subscription.localizedSubscriptionCostText)
                                .font(.sdoCaption2)
                        }
                        Spacer()
                    }
                }
                
                if let allAccessSubscription = topVideoPreviewViewModel.video.allAccessSubscription {
                    HStack {
                        Spacer()
                        VStack {
                            ActionButton(customFont: .sdoCallout, text: allAccessSubscription.localizedSubscribeButtonText) {
                                // TODO: Subscribe user to all access subscription
                            }
                            .frame(width: 250)
                            Text(allAccessSubscription.localizedSubscriptionCostText)
                                .font(.sdoCaption2)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct TopVideoPreviewActionButtonList_Previews: PreviewProvider {
    static var previews: some View {
        TopVideoPreviewActionButtonList()
            .environmentObject(TopVideoPreviewViewModel(video: exampleVideoDetail1))
    }
}
