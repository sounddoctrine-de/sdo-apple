//
//  AppTabNavigation.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

enum Tab {
    case Home
    case Search
    case Channels
    case Library
}

struct AppTabNavigation: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Binding var isNavigationBarHidden: Bool
    @State private var selection: Tab = .Home
    
    @State private var homeTabNavigationPath = NavigationPath()
    @State private var searchTabNavigationPath = NavigationPath()
    @State private var channelsTabNavigationPath = NavigationPath()
    @State private var libraryTabNavigationPath = NavigationPath()
    
    var body: some View {
        TabView(selection: $selection) {
            // Home Tab
            NavigationStack(path: $homeTabNavigationPath) {
                HomeTabView(path: $homeTabNavigationPath)
            }
            .tabItem {
                Label("homeTabLabel", systemImage: "house.fill")
                    .accessibilityLabel("homeTabLabel")
            }.tag(Tab.Home)
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }

            // Search Tab
            NavigationStack(path: $searchTabNavigationPath) {
                SearchTabView(tabSelection: $selection, path: $searchTabNavigationPath)
            }
            .tabItem {
                Label("searchTabLabel", systemImage: "magnifyingglass")
                    .accessibilityLabel("searchTabLabel")
            }.tag(Tab.Search)
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }

            // Channels Tab
            NavigationStack(path: $channelsTabNavigationPath) {
                ChannelsTabView(path: $channelsTabNavigationPath)
            }.tabItem {
                Label("channelsTabLabel", systemImage: "rectangle.stack.badge.play.fill")
                    .accessibilityLabel("channelsTabLabel")
            }.tag(Tab.Channels)

            // Profile Tab
            NavigationStack(path: $libraryTabNavigationPath) {
                ProfileTabView()
            }.tabItem {
                Label("profileTabLabel", systemImage: "play.rectangle.on.rectangle.fill")
                    .accessibilityLabel("profileTabLabel")
            }.tag(Tab.Library)
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation(
            isNavigationBarHidden: Binding.constant(true))
        .environment(\.locale, Locale(identifier: "en"))
    }
}
