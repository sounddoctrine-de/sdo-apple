//
//  ChannelRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Channels
 */
protocol ChannelRepository {
    /// Get channels data
    func getChannelsData() async -> Result<GetChannelsData, BusinessError>
    
    /// Gets the channel detail data
    func getChannelDetailData(ofChannelId channelId: String) async -> Result<ChannelDetailData, BusinessError>
}
