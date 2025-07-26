//
//  TokenRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 22/11/2022.
//

import Foundation

/**
 Repository that performs operations related to tokens
 */
protocol TokenRepository {
    /// Get the Apple ID refresh token
    func getAppleIdRefreshToken(authorizationCode: String) async -> Result<AppleTokenResponse, BusinessError>
    
    /// Revokes the Apple ID refresh token
    func revokeAppleIdRefreshToken(refreshToken: String) async -> Result<RevokeAppleTokenResponse, BusinessError>
}
