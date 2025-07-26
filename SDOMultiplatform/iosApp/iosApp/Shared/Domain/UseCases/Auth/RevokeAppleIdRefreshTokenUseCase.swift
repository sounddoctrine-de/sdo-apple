//
//  RevokeAppleIdRefreshTokenUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 25/11/2022.
//

import Foundation

/// Revokes the Apple ID refresh token assigned to a user
class RevokeAppleIdRefreshTokenUseCase {
    let tokenRepository: TokenRepository
    
    init(tokenRepository: TokenRepository) {
        self.tokenRepository = tokenRepository
    }
    
    func execute(refreshToken: String) async -> Result<RevokeAppleTokenResponse, BusinessError> {
        do {
            let appleTokenResponse = try await tokenRepository.revokeAppleIdRefreshToken(
                refreshToken: refreshToken).get()
            return .success(appleTokenResponse)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForRevokeAppleIdRefreshTokenUseCase())
            }
            return .failure(error)
        }
    }
}
