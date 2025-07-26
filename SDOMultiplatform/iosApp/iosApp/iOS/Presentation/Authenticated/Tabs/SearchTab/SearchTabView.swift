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
    
    @State private var searchText = ""
    @StateObject var searchTabViewModel = SearchTabViewModel()
    @State private var showAllResultView = false
    @State private var showSermonsResultView = false
    @State private var showDocumentariesResultView = false
    @State private var showShortsResultView = false
    @State private var showMusicResultView = false
    @State private var showInterviewsResultView = false
    
    @State private var isOnLoadedInvoked = false
    
    var body: some View {
        Group {
            if searchTabViewModel.onPageLoaded {
                ScrollView {
                    NavigationLink(
                        destination: SearchResultView(ofItemType: .all, searchText: searchText, language: LanguageData.Companion().invoke()),
                        isActive: $showAllResultView) {
                            EmptyView()
                        }
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
                                NavigationLink(
                                    destination: SearchResultView(ofItemType: .sermons, language: LanguageData.Companion().invoke()),
                                    isActive: $showSermonsResultView) {
                                    TileButton(text: "searchSermonsButtonLabel", imageName: "sermons") {
                                        showSermonsResultView = true
                                    }
                                }
                                Spacer()
                                NavigationLink(
                                    destination: SearchResultView(ofItemType: .documentaries, language: LanguageData.Companion().invoke()),
                                    isActive: $showDocumentariesResultView) {
                                    TileButton(text: "searchDocumentariesButtonLabel", imageName: "documentaries") {
                                        showDocumentariesResultView = true
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                            HStack {
                                NavigationLink(
                                    destination: SearchResultView(ofItemType: .shorts, language: LanguageData.Companion().invoke()),
                                    isActive: $showShortsResultView) {
                                    TileButton(text: "searchShortsButtonLabel", imageName: "shorts") {
                                        showShortsResultView = true
                                    }
                                }
                                Spacer()
                                NavigationLink(
                                    destination: SearchResultView(ofItemType: .music, language: LanguageData.Companion().invoke()),
                                    isActive: $showMusicResultView) {
                                    TileButton(text: "searchMusicButtonLabel", imageName: "music") {
                                        showMusicResultView = true
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                            HStack {
                                NavigationLink(
                                    destination: SearchResultView(ofItemType: .interviews, language: LanguageData.Companion().invoke()),
                                    isActive: $showInterviewsResultView) {
                                    TileButton(text: "searchInterviewsButtonLabel", imageName: "interviews") {
                                        showInterviewsResultView = true
                                    }
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
                                    NavigationLink {
                                        SearchResultView(ofItemType: .all, language: language)
                                    } label: {
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
                        showAllResultView = true
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
        SearchTabView(tabSelection: Binding.constant(.Search))
    }
}
