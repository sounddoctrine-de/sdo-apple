//
//  HasuraTokenRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 22/11/2022.
//

import Foundation

/**
 Repository that performs operations related to tokens
 */
class HasuraTokenRepository: TokenRepository {
    let graphQLService: SDOGraphQLService

    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }

    /// Get the Apple ID refresh token
    func getAppleIdRefreshToken(authorizationCode: String) async -> Result<AppleTokenResponse, BusinessError> {
        do {
            let data = try await graphQLService.executeMutation(
                mutation: GetAppleIdRefreshTokenMutation(
                    code: authorizationCode
                )
            )
            return .success(try data.toEntity())
        } catch {
            AppLogger.error("Error in getAppleIdRefreshToken: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
    
    /// Revokes the Apple ID refresh token
    func revokeAppleIdRefreshToken(refreshToken: String) async -> Result<RevokeAppleTokenResponse, BusinessError> {
        do {
            let data = try await graphQLService.executeMutation(
                mutation: RevokeAppleIdRefreshTokenMutation(
                    refreshToken: refreshToken
                )
            )
            return .success(try data.toEntity())
        } catch {
            AppLogger.error("Error in revokeAppleIdRefreshToken: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
}
