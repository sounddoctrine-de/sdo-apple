//
//  VideoPlayerView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 17/10/2022.
//

import SwiftUI
import AVFoundation
import AVKit

protocol PlayableVideo {
    var videoId: String { get }
    var title: String { get }
    var speakerName: String { get }
    var channelName: String { get }
    var datePublished: Date { get }
    var likedByUser: Bool? { get set }
}

struct VideoPlayerView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var videoPlayerViewModel = VideoPlayerViewModel()
    @State var video: PlayableVideo
    @State var isShowingSignInSheet: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                
                SDOVideoPlayer(player: videoPlayerViewModel.player)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .frame(maxHeight: .infinity)
            }
            .frame(minHeight: 140, maxHeight: 350)
            
            Spacer()
                .frame(height: 10)
            
            ScrollView {
                Text(video.title)
                    .font(.sdoTitle3)
                    .multilineTextAlignment(.center)
                
                Text("\(video.speakerName) · \(video.channelName)")
                    .font(.sdoCaption)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .multilineTextAlignment(.center)
                
                Text(video.datePublished.formatted(date: .abbreviated, time: .omitted))
                    .font(.sdoCaption)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 20)
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button {
                        if case let .signedIn(user) = authViewModel.state,
                           user.isAnonymous
                        {
                            isShowingSignInSheet = true
                        } else {
                            if video.likedByUser != true {
                                video.likedByUser = true
                                videoPlayerViewModel.updateLikeDislikeStatus(
                                    with: true,
                                    forVideoId: video.videoId
                                )
                            } else {
                                video.likedByUser = nil
                                videoPlayerViewModel.updateLikeDislikeStatus(
                                    with: nil,
                                    forVideoId: video.videoId
                                )
                            }
                        }
                    } label: {
                        VStack {
                            if video.likedByUser == true {
                                Image(systemName: "hand.thumbsup.fill")
                            } else {
                                Image(systemName: "hand.thumbsup")
                            }
                            Text("videoPlayerViewILikeThisLabel")
                        }
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom)
                    }
                    
                    Button {
                        if case let .signedIn(user) = authViewModel.state,
                           user.isAnonymous
                        {
                            isShowingSignInSheet = true
                        } else {
                            if video.likedByUser != false {
                                video.likedByUser = false
                                videoPlayerViewModel.updateLikeDislikeStatus(
                                    with: false,
                                    forVideoId: video.videoId
                                )
                            } else {
                                video.likedByUser = nil
                                videoPlayerViewModel.updateLikeDislikeStatus(
                                    with: nil,
                                    forVideoId: video.videoId
                                )
                            }
                        }
                    } label: {
                        VStack {
                            if video.likedByUser == false {
                                Image(systemName: "hand.thumbsdown.fill")
                            } else {
                                Image(systemName: "hand.thumbsdown")
                            }
                            Text("videoPlayerViewNotForMeLabel")
                        }
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $isShowingSignInSheet) {
            SignInSheetView(showFeatureNeedsAnAccountToWork: true)
                .presentationDetents([.height(300)])
                .presentationDragIndicator(.visible)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            videoPlayerViewModel.onBackPressed()
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
        })
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(
            video: exampleVideoDetail1
        )
    }
}
