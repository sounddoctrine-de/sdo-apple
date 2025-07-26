//
//  ChannelsMapViewCoordinator.swift
//  SDO
//
//  Created by Joel Kingsley on 07/10/2022.
//

import MapKit
import UIKit
import SwiftUI

class ChannelsMapViewCoordinator: NSObject, MKMapViewDelegate {
    var parent: MapView

    init(_ parent: MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        views.forEach { view in
            if let markerView = view as? MKMarkerAnnotationView {
                // Setup baloon marker image
                if let annotation = markerView.annotation,
                   let channelData = annotation as? GetChannelsData.ChannelData
                {
                    switch channelData.type {
                    case .church:
                        markerView.glyphImage = UIImage(systemName: "building.columns.fill")
                    case .soulWinningClub:
                        markerView.glyphImage = UIImage(systemName: "person.3.fill")
                    }
                    
                    let label = UILabel()
                    label.text = channelData.addressText
                    label.font = .preferredFont(forTextStyle: .caption1)
                    label.textColor = .secondaryLabel
                    view.detailCalloutAccessoryView = label
                }
            }
            view.calloutOffset = CGPoint(x: 0, y: 10)
            let button = UIButton(type: .detailDisclosure)
            view.rightCalloutAccessoryView = button
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? GetChannelsData.ChannelData  {
            parent.selectedChannelIdForShowDetail = annotation.channelId
            parent.showChannelDetail = true
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
    }
}
