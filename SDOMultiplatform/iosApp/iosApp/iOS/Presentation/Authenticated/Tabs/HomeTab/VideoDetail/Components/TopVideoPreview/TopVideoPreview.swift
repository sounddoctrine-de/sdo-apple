//
//  TopVideoPreview.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 30/06/2022.
//

import SwiftUI
import Kingfisher
import AVKit
import Combine

protocol TopPreviewableVideo {
    var videoId: String { get }
    var title: String { get }
    var localizedType: String { get }
    var thumbnailURL: URL { get }
    var datePublished: Date { get }
    var description: String { get }
    var speakerName: String { get }
    var canUserWatch: Bool { get }
    var subscriptionForWatching: SubscriptionData? { get }
    var allAccessSubscription: SubscriptionData? { get }
    var signedUrl: URL? { get }
    var likedByUser: Bool? { get set }
}

struct TopVideoPreview: View {
    @ObservedObject var topVideoPreviewViewModel: TopVideoPreviewViewModel
    @State var showMoreSheet: Bool = false
    
    init(video: TopPreviewableVideo & PlayableVideo) {
        self.topVideoPreviewViewModel = TopVideoPreviewViewModel(video: video)
    }
    
    var body: some View {
        ZStack {
            VStack {
                KFImage(topVideoPreviewViewModel.video.thumbnailURL)
                    .resizable()
                    .aspectRatio(
                        CGSize(width: 1280, height: 720),
                        contentMode: .fit
                    )
                    .clipped()
                    .overlay(content: {
                        LinearGradient(
                            colors: [
                                Color(uiColor: UIColor.systemBackground).opacity(0.0),
                                Color(uiColor: UIColor.systemBackground).opacity(0.10),
                                Color(uiColor: UIColor.systemBackground).opacity(0.99)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .padding(.top, -150)
                    })
                Spacer()
                    .frame(height: topVideoPreviewViewModel.contentHeight)
            }

            VStack {
                Spacer()
                
                Group {
                    Text(topVideoPreviewViewModel.video.title)
                        .font(.customTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(Color(uiColor: .label))
                    
                    Text(topVideoPreviewViewModel.video.localizedType)
                        .font(.sdoCallout)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    
                    Text(
                        "\(topVideoPreviewViewModel.video.datePublished.formatted(date: .abbreviated, time: .omitted)) · \(topVideoPreviewViewModel.video.speakerName)"
                    )
                        .font(.sdoCaption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    
                    Text(topVideoPreviewViewModel.video.channelName)
                        .font(.sdoCaption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                
                TopVideoPreviewActionButtonList().environmentObject(topVideoPreviewViewModel)
                
                Text(topVideoPreviewViewModel.video.description)
                    .lineLimit(1...2)
                    .foregroundColor(Color(uiColor: .label))
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .truncationMode(.tail)
                
                HStack {
                    Spacer()
                    Button {
                        showMoreSheet = true
                    } label: {
                        Text("videoDetailMoreTextLabel")
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .sheet(isPresented: $showMoreSheet) {
            VStack {
                HStack {
                    Spacer()
                    
                    Button("topVideoPreviewDoneLabel") {
                        showMoreSheet = false
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    Text(topVideoPreviewViewModel.video.title)
                        .font(.sdoTitle3)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                
                Text(topVideoPreviewViewModel.video.description)
                    .foregroundColor(Color(uiColor: .label))
                    .padding(.horizontal)
                
                Spacer()
            }
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
    }
}

struct TopVideoPreview_Previews: PreviewProvider {
    static var previews: some View {
        TopVideoPreview(video: exampleVideoDetail1)
    }
}
