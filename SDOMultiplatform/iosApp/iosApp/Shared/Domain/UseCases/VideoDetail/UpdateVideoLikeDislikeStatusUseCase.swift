//
//  UpdateVideoLikeDislikeStatusUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

class UpdateVideoLikeDislikeStatusUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, BusinessError> {
        do {
            let updateVideoLikeDislikeResponseData = try await videoRepository.updateVideoLikeDislikeStatus(
                withPayload: payload).get()
            return .success(updateVideoLikeDislikeResponseData)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForUpdateVideoLikeDislikeStatusUseCase())
            }
            return .failure(error)
        }
    }
}
