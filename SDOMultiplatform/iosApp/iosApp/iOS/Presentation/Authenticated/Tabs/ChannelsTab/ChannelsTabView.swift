//
//  ChannelsTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 07/10/2022.
//

import SwiftUI
import MapKit

struct ChannelsTabView: View {
    @ObservedObject var channelsTabViewModel = ChannelsTabViewModel()
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State var isShowingSearchSheet = false

    @Binding var path: NavigationPath

    var body: some View {
        switch channelsTabViewModel.channelsData {
        case .success:
            ZStack {
                MapView(
                    channelsTabViewModel: channelsTabViewModel,
                    onChannelSelected: { channel in
                        path.append(channel)
                    }
                )
                .navigationDestination(for: ChannelData.self) { channel in
                    ChannelDetailView(channelId: channel.channelId)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            isShowingSearchSheet = true
                        } label: {
                            Image(systemName: "list.bullet.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.accentColor)
                                .background(Color(uiColor: .systemBackground))
                                .clipShape(Circle())
                                .shadow(radius: 25)
                        }
                        .padding(.all, 20)
                    }
                    Spacer()
                        .frame(height: 20)
                }
                
                VStack {
                    Spacer()
                        .frame(height: 80)
                    HStack {
                        Spacer()
                        Button {
                            channelsTabViewModel.channelsData = nil
                            channelsTabViewModel.onLoaded()
                        } label: {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.accentColor)
                                .background(Color(uiColor: .systemBackground))
                                .clipShape(Circle())
                                .shadow(radius: 25)
                        }
                        Spacer()
                            .frame(width: 10)

                    }
                    Spacer()
                }
            }
            .sheet(isPresented: $isShowingSearchSheet) {
                ChannelsSelectionSheet(
                    channelsTabViewModel: channelsTabViewModel
                )
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(
                Text("channelsScreenTitle", comment: "Label: Navigation bar title of Subscriptions Screen")
            )
            .navigationDestination(for: ChannelDetailData.Video.self) { video in
                VideoDetailView(
                    videoId: video.videoId,
                    channelId: video.channelId,
                    path: $path
                )
            }
            .navigationDestination(for: HomeScreenData.HomeVideo.self) { video in
                VideoDetailView(
                    videoId: video.videoId,
                    channelId: video.channelId,
                    path: $path
                )
            }
        case .failure(let error):
            CustomErrorView(
                error: error,
                authViewModel: authViewModel) {
                    channelsTabViewModel.onLoaded()
                }
        case .none:
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    channelsTabViewModel.onLoaded()
                }
        }
    }
}

struct ChannelsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsTabView(path: Binding.constant(NavigationPath()))
    }
}
