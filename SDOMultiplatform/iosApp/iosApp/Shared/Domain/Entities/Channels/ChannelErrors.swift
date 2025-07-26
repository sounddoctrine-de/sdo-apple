//
//  ChannelErrors.swift
//  SDO
//
//  Created by Joel Kingsley on 15/10/2022.
//

import Foundation

extension BusinessErrors.customError {
    func asErrorForGetChannelsDataUseCase() -> BusinessError {
        return BusinessErrors.serverError()
    }
}

extension BusinessErrors.customError {
    func asErrorForGetChannelDetailDataUseCase() -> BusinessError {
        return BusinessErrors.serverError()
    }
}
