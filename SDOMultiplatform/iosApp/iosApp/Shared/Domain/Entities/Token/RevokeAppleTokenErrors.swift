//
//  RevokeAppleTokenErrors.swift
//  SDO
//
//  Created by Joel Kingsley on 25/11/2022.
//

import Foundation

extension BusinessErrors.customError {
    func asErrorForRevokeAppleIdRefreshTokenUseCase() -> BusinessError {
        switch code {
        case "REFRESH_TOKEN_NOT_SET":
            return BusinessErrors.clientError()
        default:
            return BusinessErrors.serverError()
        }
    }
}
