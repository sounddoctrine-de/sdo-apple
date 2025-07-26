//
//  RevokeAppleIdRefreshTokenDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 25/11/2022.
//

import Foundation

extension RevokeAppleIdRefreshTokenMutation.Data {
    func toEntity() throws -> RevokeAppleTokenResponse {
        guard let revokeAppleIdRefreshToken else {
            throw BusinessErrors.parsingError()
        }
        return RevokeAppleTokenResponse(isRevoked: revokeAppleIdRefreshToken.isRevoked)
    }
}
