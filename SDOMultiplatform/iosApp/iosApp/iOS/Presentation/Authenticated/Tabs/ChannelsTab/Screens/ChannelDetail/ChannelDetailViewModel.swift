//
//  ChannelDetailViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 01/11/2022.
//

import Foundation
import MapKit
import SwiftUI

@MainActor
class ChannelDetailViewModel: ObservableObject {
    private let getChannelDetailDataUseCase = GetChannelsDetailDataUseCase(
        channelsRepository: HasuraChannelRepository(
            graphQLService: HasuraGraphQLService()))
    
    let channelId: String?
    @Published var channelDetailData: Result<ChannelDetailData, BusinessError>?
    
    init(channelId: String?) {
        self.channelId = channelId
    }
    
    func onLoaded() {
        guard let channelId else { return }
        Task {
            switch await getChannelDetailDataUseCase.execute(channelId: channelId) {
            case let .success(data):
                self.channelDetailData = .success(data)
            case let .failure(error):
                AppLogger.error(error.localizedDescription)
                self.channelDetailData = .failure(error)
            }
        }
    }
    
    func onOpenInMapPressed(channel: ChannelDetailData) {
        let coordinate = CLLocationCoordinate2DMake(channel.location.latitude, channel.location.longitude)
        let place = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: place)
        mapItem.name = channel.channelName
        mapItem.openInMaps(launchOptions: nil)
    }
    
    func getChannelInfoString(channel: ChannelDetailData) -> String {
        var text = channel.channelType.localizedString()
        text.append(" · ")
        text.append(String(channel.videosInChannel.count))
        text.append(" ")
        let videoLabel = String(localized: String.LocalizationValue("channelDetailVideosLabel"))
        text.append(videoLabel)
        return text
    }
}
