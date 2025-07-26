//
//  HasuraLanguageRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation
import ComposeApp

/**
 Repository that performs operations related to languages
 */
class HasuraLanguageRepository: LanguageRepository {
    let graphQLService: SDOGraphQLService
    
    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }
    
    /// Get all languages
    func getAllLanguages() async -> Result<[LanguageData], BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetAllLanguagesQuery())
            return .success(data.toEntity())
        } catch {
            AppLogger.error("Error in getAllLanguages: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
}
