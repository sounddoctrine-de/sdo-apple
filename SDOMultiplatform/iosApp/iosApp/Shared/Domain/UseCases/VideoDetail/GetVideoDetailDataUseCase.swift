//
//  GetVideoDetailDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

/**
 Sets up and returns the video detail data
 */
class GetVideoDetailDataUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(videoId: String, channelId: String, userUuid: String) async -> Result<VideoDetailData, BusinessError> {
        async let infoDataResult = videoRepository.getVideoDetailData(
            videoId: videoId, channelId: channelId, userUuid: userUuid
        )
        async let signedUrlResult = videoRepository.getSignedUrlOfVideo(ofVideoId: videoId)
        
        do {
            let infoData = try await infoDataResult.get()
            // If signed url result errors, then just return nil
            let signedUrl = try? await signedUrlResult.get()
            
            // TODO: Retrieve and set subscription data
            return .success(
                VideoDetailData(
                    infoData: infoData,
                    videoUrl: signedUrl,
                    subscriptionVideoBelongsTo: nil,
                    allAccessSubscription: nil
                )
            )
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetVideoDetailDataUseCase())
            }
            return .failure(error)
        }
    }
}
