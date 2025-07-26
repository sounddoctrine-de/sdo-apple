//
//  VideoDetailViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

@MainActor
class VideoDetailViewModel: ObservableObject {
    let getVideoDetailDataUseCase = GetVideoDetailDataUseCase(
        videoRepository: HasuraVideoRepository(
            graphQLService: HasuraGraphQLService()))
    
    let videoId: String
    let channelId: String
    
    init(videoId: String, channelId: String) {
        self.videoId = videoId
        self.channelId = channelId
    }
    
    @Published var videoDetailData: Result<VideoDetailData, BusinessError>?
    
    func onLoaded(user: SDOUser?) {
        Task {
            await getVideoDetailData(user: user)
        }
    }
    
    func getVideoDetailData(user: SDOUser?) async {
        guard let user = user else {
            return
        }
        switch await getVideoDetailDataUseCase.execute(
            videoId: videoId,
            channelId: channelId,
            userUuid: user.uid
        ) {
        case let .success(data):
            videoDetailData = .success(data)
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
            videoDetailData = .failure(error)
        }
    }
}
