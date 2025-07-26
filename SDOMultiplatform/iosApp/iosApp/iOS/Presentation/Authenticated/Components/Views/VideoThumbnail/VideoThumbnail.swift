//
//  VideoThumbnail.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import SwiftUI
import Kingfisher

enum VideoThumbnailStyle {
    case large
    case medium
    case small
    case xsmall
}

struct VideoThumbnail: View {
    let video: ThumbnailableVideo
    
    let style: VideoThumbnailStyle
    
    @Binding var thumbnailWidth: CGFloat
    
    private var imageWidth: CGFloat {
        switch style {
        case .large:
            return 350
        case .medium:
            return 250
        case .small:
            return 200
        case .xsmall:
            return 100
        }
    }
    
    private var imageHeight: CGFloat {
        switch style {
        case .large:
            return 200
        case .medium:
            return 150
        case .small:
            return 120
        case .xsmall:
            return 60
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            KFImage(video.thumbnailURL)
                .resizable()
                .scaledToFill()
                .frame(
                    width: imageWidth,
                    height: geometry.size.height
                )
                .cornerRadius(15)
                .onAppear {
                    thumbnailWidth = imageWidth
                }
        }
        .frame(height: imageHeight)
    }
}

struct VideoThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumbnail(
            video: exampleVideo1,
            style: .large,
            thumbnailWidth: Binding.constant(200)
        )
    }
}
