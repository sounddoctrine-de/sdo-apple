//
//  AppleTokenErrors.swift
//  SDO
//
//  Created by Joel Kingsley on 23/11/2022.
//

import Foundation

extension BusinessErrors.customError {
    func asErrorForGetAppleIdRefreshTokenUseCase() -> BusinessError {
        switch code {
        case "CODE_NOT_SET":
            return BusinessErrors.clientError()
        default:
            return BusinessErrors.serverError()
        }
    }
}

