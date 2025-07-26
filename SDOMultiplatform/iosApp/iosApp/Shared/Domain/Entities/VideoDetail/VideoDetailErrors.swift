//
//  VideoDetailErrors.swift
//  SDO
//
//  Created by Joel Kingsley on 29/09/2022.
//

import Foundation

extension BusinessErrors.customError {
    func asErrorForGetVideoDetailDataUseCase() -> BusinessError {
        switch code {
        case "VIDEO_ID_NOT_SET":
            return BusinessErrors.clientError()
        case "TOKEN_INVALID":
            return BusinessErrors.unauthorized()
        case "SERVER_ERROR":
            return BusinessErrors.serverError()
        case "SIGNING_URL_ERROR":
            return BusinessErrors.serverError()
        default:
            return BusinessErrors.serverError()
        }
    }
}
