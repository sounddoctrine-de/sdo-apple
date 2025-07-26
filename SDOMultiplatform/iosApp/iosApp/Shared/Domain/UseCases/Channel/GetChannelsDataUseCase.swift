//
//  GetChannelsDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 15/10/2022.
//

import Foundation

/// Gets list of all channels
class GetChannelsDataUseCase {
    let channelsRepository: ChannelRepository
    
    init(channelsRepository: ChannelRepository) {
        self.channelsRepository = channelsRepository
    }
    
    func execute() async -> Result<GetChannelsData, BusinessError> {
        async let getChannelsResult = channelsRepository.getChannelsData()
        
        do {
            let getChannelsResultData = try await getChannelsResult.get()
            return .success(getChannelsResultData)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetChannelsDataUseCase())
            }
            return .failure(error)
        }
    }
}
