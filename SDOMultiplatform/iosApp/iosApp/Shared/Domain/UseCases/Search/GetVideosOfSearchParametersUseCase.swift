//
//  GetVideosOfSearchParametersUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 01/10/2022.
//

import Foundation

/// Sets up and returns the video detail data
class GetVideosOfSearchParametersUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, BusinessError> {
        async let videosOfSearchParametersResult = videoRepository.getVideosOfSearchParameters(
            ofSearchResultInputData: searchResultInputData
        )
        
        do {
            let searchResultData = try await videosOfSearchParametersResult.get()
            return .success(searchResultData)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetVideosOfSearchParametersUseCase())
            }
            return .failure(error)
        }
    }
}
