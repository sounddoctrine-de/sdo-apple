//
//  HomeTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var homeTabViewModel = HomeTabViewModel()
    
    var body: some View {
        if let homeScreenData = homeTabViewModel.homeScreenData {
            switch homeScreenData {
            case let .success(data):
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            if !data.documentaries.isEmpty {
                                HomeVideosRow(
                                    title: "homeDocumentariesLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.documentaries,
                                    showAllItemType: .documentaries
                                )
                            }
                            if !data.sermons.isEmpty {
                                HomeVideosRow(
                                    title: "homeSermonsLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.sermons,
                                    showAllItemType: .sermons
                                )
                            }
                            if !data.shorts.isEmpty {
                                HomeVideosRow(
                                    title: "homeShortsLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.shorts,
                                    showAllItemType: .shorts
                                )
                            }
                            if !data.musicVideos.isEmpty {
                                HomeVideosRow(
                                    title: "homeMusicLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.musicVideos,
                                    showAllItemType: .music
                                )
                            }
                            if !data.interviews.isEmpty {
                                HomeVideosRow(
                                    title: "homeInterviewsLabel",
                                    videoThumbnailStyle: .small,
                                    videos: data.interviews,
                                    showAllItemType: .interviews
                                )
                            }
                        }
                    }
                    .refreshable {
                        await homeTabViewModel.onRefresh(user: authViewModel.getUser())
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .navigationBarTitle(Text("homeScreenTitle", comment: "Label: Navigation bar title of Home Screen"))
            case let .failure(error):
                CustomErrorView(
                    error: error,
                    authViewModel: authViewModel) {
                        homeTabViewModel.onLoaded(user: authViewModel.getUser())
                    }
            }
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    homeTabViewModel.onLoaded(user: authViewModel.getUser())
                }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
