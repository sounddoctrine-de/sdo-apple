//
//  GetChannelDetailDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 02/11/2022.
//

import Foundation

/// Gets the channel detail data
class GetChannelsDetailDataUseCase {
    let channelsRepository: ChannelRepository
    
    init(channelsRepository: ChannelRepository) {
        self.channelsRepository = channelsRepository
    }
    
    func execute(channelId: String) async -> Result<ChannelDetailData, BusinessError> {
        async let getChannelDetailDataResult = channelsRepository.getChannelDetailData(ofChannelId: channelId)
        
        do {
            let getChannelDetailData = try await getChannelDetailDataResult.get()
            return .success(getChannelDetailData)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetChannelDetailDataUseCase())
            }
            return .failure(error)
        }
    }
}
