//
//  FilterChannelsUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 16/10/2022.
//

import Foundation

/// Filters channels by region and search text
class FilterChannelsUseCase {
    func execute(
        _ channels: [GetChannelsData.ChannelData],
        withRegion region: Locale.Region,
        withSearchText searchText: String
    ) -> [GetChannelsData.ChannelData] {
        if region == .world {
            /// Only filter with search text if region is `world`
            return channels
                .filter { channel in
                    if !searchText.isEmpty {
                        return channel.channelName.lowercased()
                            .contains(
                                searchText
                                    .lowercased()
                                    .trimmingCharacters(in: .whitespacesAndNewlines))
                    }
                    return true
                }
        } else {
            /// Filter with region and search text
            let regionCode = region.identifier
            return channels
                .filter { channel in
                    regionCode == channel.regionCode ||
                    regionCode == Locale.Region(channel.regionCode).containingRegion?.identifier ||
                    regionCode == Locale.Region(channel.regionCode).continent?.identifier
                }
                .filter { channel in
                    if !searchText.isEmpty {
                        return channel.channelName.lowercased()
                            .contains(
                                searchText
                                    .lowercased()
                                    .trimmingCharacters(in: .whitespacesAndNewlines))
                    }
                    return true
                }
        }
    }
}
