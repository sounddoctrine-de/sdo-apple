//
//  MapView.swift
//  SDO
//
//  Created by Joel Kingsley on 07/10/2022.
//

import SwiftUI
import MapKit
import Combine

struct MapView: UIViewRepresentable {
    @ObservedObject var channelsTabViewModel: ChannelsTabViewModel
    @Binding var showChannelDetail: Bool
    @Binding var selectedChannelIdForShowDetail: String?
    
    // Create the MKMapView using UIKit
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = channelsTabViewModel.region
        channelsTabViewModel.filteredChannels.forEach { place in
            mapView.addAnnotation(place)
        }
        mapView.showAnnotations(channelsTabViewModel.filteredChannels, animated: true)
        
        channelsTabViewModel.updateAnnotationsListener(mapView: mapView)
        return mapView
    }
    
    // Updates map when binding variable changes
    func updateUIView(_ view: MKMapView, context: Context) {}
    
    // Link it to the coordinator which is defined below.
    func makeCoordinator() -> ChannelsMapViewCoordinator {
        ChannelsMapViewCoordinator(self)
    }

}
