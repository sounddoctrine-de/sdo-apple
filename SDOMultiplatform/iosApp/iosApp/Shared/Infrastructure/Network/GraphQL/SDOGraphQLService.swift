//
//  SDOGraphQLService.swift
//  SDO
//
//  Created by Joel Kingsley on 11/08/2022.
//

import Foundation
import Apollo

/**
 Used to perform GraphQL operations in the app
 */
protocol SDOGraphQLService {
    /// Executes a GraphQL query and returns a data response or throws an error
    func executeQuery<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        contextIdentifier: UUID?,
        queue: DispatchQueue
    ) async throws -> Query.Data
    
    /// Executes a GraphQL mutation and returns a data response or throws an error
    func executeMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool,
        queue: DispatchQueue
    ) async throws -> Mutation.Data
}

// MARK: - Syntax Sugar

extension SDOGraphQLService {
    /// Executes a GraphQL query and returns a data response or throws an error
    func executeQuery<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .fetchIgnoringCacheCompletely,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .global()
    ) async throws -> Query.Data {
        return try await executeQuery(
            query: query,
            cachePolicy: cachePolicy,
            contextIdentifier: contextIdentifier,
            queue: queue
        )
    }
    
    /// Executes a GraphQL mutation and returns a data response or throws an error
    func executeMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .global()
    ) async throws -> Mutation.Data {
        return try await executeMutation(
            mutation: mutation,
            publishResultToStore: publishResultToStore,
            queue: queue
        )
    }
}
