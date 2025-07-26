//
//  GetAppleIdRefreshTokenDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 23/11/2022.
//

import Foundation

extension GetAppleIdRefreshTokenMutation.Data {
    func toEntity() throws -> AppleTokenResponse {
        guard let getAppleIdRefreshToken
        else {
            throw BusinessErrors.parsingError()
        }
        return AppleTokenResponse(refreshToken: getAppleIdRefreshToken.refreshToken)
    }
}
