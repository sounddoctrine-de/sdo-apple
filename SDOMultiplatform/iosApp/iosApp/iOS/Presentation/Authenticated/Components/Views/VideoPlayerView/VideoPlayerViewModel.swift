//
//  VideoPlayerViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 03/09/2022.
//

import Foundation
import AVFoundation
import AVKit

@MainActor
class VideoPlayerViewModel: ObservableObject {
    let updateVideoLikeDislikeStatusUseCase = UpdateVideoLikeDislikeStatusUseCase(
        videoRepository: HasuraVideoRepository(
            graphQLService: HasuraGraphQLService()))
    
    var task: Task<Result<UpdateVideoLikeDislikeResponseData, BusinessError>, Never>?
    
    var player: AVPlayer {
        PlayerState.shared.player
    }
    
    func onBackPressed() {
        PlayerState.shared.stopVideoIfPlayingAsEmbedded()
    }
    
    func updateLikeDislikeStatus(with isLikedByUser: Bool?, forVideoId videoId: String) {
        guard let userPrimaryKey = UserSession.userPrimaryKey else {
            return
        }
        task?.cancel()
        task = Task {
            await updateVideoLikeDislikeStatusUseCase.execute(
                payload: VideoLikeDislikeInputData(
                    likedByUser: isLikedByUser,
                    videoId: videoId,
                    userPrimaryKey: userPrimaryKey
                ))
        }
    }
}
