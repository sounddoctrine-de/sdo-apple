//
//  HasuraChannelRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Channels
 */
class HasuraChannelRepository: ChannelRepository {
    let graphQLService: SDOGraphQLService
    
    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }
    
    /// Get channels data
    func getChannelsData() async -> Result<GetChannelsData, BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetAllChannelsQuery())
            return .success(try data.toEntity())
        } catch {
            AppLogger.error("Error in getAllChannels: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
    
    /// Gets the channel detail data
    func getChannelDetailData(ofChannelId channelId: String) async -> Result<ChannelDetailData, BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetChannelDetailQuery(channelId: channelId))
            return .success(try data.toEntity())
        } catch {
            AppLogger.error("Error in getChannelDetailData: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
}
