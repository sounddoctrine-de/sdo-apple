//
//  GetChannelsData.swift
//  SDO
//
//  Created by Joel Kingsley on 15/10/2022.
//

import Foundation
import MapKit

struct GetChannelsData {
    class ChannelData: NSObject, MKAnnotation, Identifiable {
        struct Location {
            let latitude: Double
            let longitude: Double
        }
        
        let channelId: String
        let channelName: String
        let type: ChannelTypeData
        let location: Location
        let regionCode: String
        let addressText: String
        
        var title: String? {
            return channelName
        }
        
        var subtitle: String? {
            return addressText
        }
        
        var coordinate: CLLocationCoordinate2D {
            return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        }
        
        init(
            channelId: String,
            channelName: String,
            type: ChannelTypeData,
            location: Location,
            regionCode: String,
            addressText: String
        ) {
            self.channelId = channelId
            self.channelName = channelName
            self.type = type
            self.location = location
            self.regionCode = regionCode
            self.addressText = addressText
        }
    }
    
    let channels: [ChannelData]
}
