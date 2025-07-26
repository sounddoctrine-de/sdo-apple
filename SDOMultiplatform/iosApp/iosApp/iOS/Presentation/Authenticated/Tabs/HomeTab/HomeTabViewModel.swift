//
//  HomeTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation
import SwiftUI

@MainActor
class HomeTabViewModel: ObservableObject {
    private let getHomeScreenDataUseCase = GetHomeScreenDataUseCase(
        videoRepository: HasuraVideoRepository(
            graphQLService: HasuraGraphQLService()))
    
    @Published var homeScreenData: Result<HomeScreenData, BusinessError>?
    
    func onLoaded(user: SDOUser?) {
        Task {
            await getHomeScreenData(user: user)
        }
    }
    
    func onRefresh(user: SDOUser?) async {
        await getHomeScreenData(user: user)
    }
    
    private func getHomeScreenData(user: SDOUser?) async {
        guard let user = user else {
            return
        }
        switch await getHomeScreenDataUseCase.execute(userUuid: user.uid) {
        case let .success(data):
            homeScreenData = .success(data)
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
            homeScreenData = .failure(error)
        }
    }
}
