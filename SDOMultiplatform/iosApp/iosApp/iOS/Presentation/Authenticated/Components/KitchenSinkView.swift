//
//  KitchenSinkView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 12/06/2022.
//

import SwiftUI
import MapKit
import AVKit
import AVFoundation

struct KitchenSinkView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    @State var thumbnailWidth: CGFloat = 0
    
    var body: some View {
        VStack {
//            Map(coordinateRegion: $region)
//                .frame(height: 300)
            VStack(alignment: .center) {
                
                let _ = Self._printChanges()
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        let videos = [
                            exampleVideo1,
                            exampleVideo2
                        ]
                        ForEach(videos) { video in
                            VideoThumbnail(video: video, style: .medium, thumbnailWidth: $thumbnailWidth)
                                .frame(width: 300, height: 200)
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                        }
                    }
                }
                
                // Video Player
                VideoPlayer(player: AVPlayer(url:  URL(string: "https://www.kjv1611only.com/video/02preaching/Sermons_Pastor_Anderson/Bible_College.mp4")!)) {
//                    VStack {
//                        Text("Watermark")
//                            .foregroundColor(.black)
//                            .background(.white.opacity(0.7))
//                        Spacer()
//                    }
                }.frame(height: 300)
                
//                ForEach(UIFont.familyNames, id: \.self) { familyName in
//                    Text("\(familyName) \n- Sound Doctrine Online")
//                        .font(
//                            .custom(familyName, size: 20)
//                        )
//                }
            }
        }
    }
}

struct KitchenSinkView_Previews: PreviewProvider {
    static var previews: some View {
        KitchenSinkView()
            .previewInterfaceOrientation(.portrait)
    }
}
