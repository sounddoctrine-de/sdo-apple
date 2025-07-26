//
//  SearchTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 28/07/2022.
//

import SwiftUI
import ComposeApp

struct SearchTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Binding var tabSelection: Tab
    @Binding var path: NavigationPath
    
    @State private var searchText = ""
    @StateObject var searchTabViewModel = SearchTabViewModel()
    
    @State private var isOnLoadedInvoked = false
    
    var body: some View {
        Group {
            if searchTabViewModel.onPageLoaded {
                ScrollView {
                    VStack {
                        HStack {
                            Text("searchBrowseLabel")
                                .font(.sdoTitle2)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                        
                        VStack {
                            HStack {
                                TileButton(text: "searchSermonsButtonLabel", imageName: "sermons") {
                                    path.append(
                                        SearchQueryData(
                                            itemType: .sermons, language: LanguageData.Companion().invoke()
                                        )
                                    )
                                }
                                Spacer()
                                TileButton(text: "searchDocumentariesButtonLabel", imageName: "documentaries") {
                                    path.append(
                                        SearchQueryData(
                                            itemType: .documentaries, language: LanguageData.Companion().invoke()
                                        )
                                    )
                                }
                            }
                            .padding(.horizontal, 10)
                            HStack {
                                TileButton(text: "searchShortsButtonLabel", imageName: "shorts") {
                                    path.append(
                                        SearchQueryData(
                                            itemType: .shorts, language: LanguageData.Companion().invoke()
                                        )
                                    )
                                }
                                Spacer()
                                TileButton(text: "searchMusicButtonLabel", imageName: "music") {
                                    path.append(
                                        SearchQueryData(
                                            itemType: .music, language: LanguageData.Companion().invoke()
                                        )
                                    )
                                }
                            }
                            .padding(.horizontal, 10)
                            HStack {
                                TileButton(text: "searchInterviewsButtonLabel", imageName: "interviews") {
                                    path.append(
                                        SearchQueryData(
                                            itemType: .interviews, language: LanguageData.Companion().invoke()
                                        )
                                    )
                                }
                                Spacer()
                                TileButton(text: "searchChannelsButtonLabel", imageName: "channels") {
                                    tabSelection = .Channels
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                        }
                        .frame(maxWidth: 600)
                        
                        if !searchTabViewModel.languages.isEmpty {
                            HStack {
                                Text("searchLanguagesLabel")
                                    .font(.sdoTitle2)
                                    .bold()
                                Spacer()
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                            
                            VStack {
                                ForEach(searchTabViewModel.languages, id: \.self) { language in
                                    NavigationLink(value: language) {
                                        VStack {
                                            HStack {
                                                Text(language.sourceCountryFlag)
                                                    .padding(.horizontal, 5)
                                                    .font(.sdoBody)
                                                Text(language.languageName)
                                                    .font(.sdoBody)
                                                Spacer()
                                            }
                                            Divider()
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        
                        Spacer()
                    }
                    .onAppear(perform: {
                        searchTabViewModel.onLoaded()
                    })
                    .searchable(
                        text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "searchBarPlaceholderLabel")
                    .navigationBarTitle(Text("searchScreenTitle", comment: "Label: Navigation bar title of Search Screen"))
                    .onSubmit(of: .search) {
                        path.append(
                            SearchQueryData(
                                itemType: .sermons, searchText: searchText, language: LanguageData.Companion().invoke()
                            )
                        )
                    }
                    .navigationDestination(for: SearchQueryData.self, destination: { queryData in
                        SearchResultView(ofItemType: queryData.itemType, searchText: queryData.searchText, language: queryData.language, path: $path)
                    })
                    .navigationDestination(for: SearchResultData.Video.self) { video in
                        VideoDetailView(videoId: video.videoId, channelId: video.channelId, path: $path)
                    }
                    .navigationDestination(for: LanguageData.self) { language in
                        SearchResultView(ofItemType: .all, language: language, path: $path)
                    }
                }
            } else {
                ProgressView("progressViewLoadingLabel")
                    .progressViewStyle(.circular)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle(Text("searchScreenTitle", comment: "Label: Navigation bar title of Search Screen"))
            }
        }
        .onAppear(perform: {
            if !isOnLoadedInvoked {
                searchTabViewModel.onLoaded()
                isOnLoadedInvoked = true
            }
        })
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView(tabSelection: Binding.constant(.Search), path: Binding.constant(NavigationPath()))
    }
}
