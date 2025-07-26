//
//  GetHomeScreenDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

/// Retrieves the home screen data
class GetHomeScreenDataUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(userUuid: String) async -> Result<HomeScreenData, BusinessError> {
        do {
            let homeScreenData = try await videoRepository.getHomeScreenData().get()
            return .success(homeScreenData)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetHomeScreenDataUseCase())
            }
            return .failure(error)
        }
    }
}
