//
//  TopVideoPreviewViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import Foundation
import SwiftUI
import AVFoundation

class TopVideoPreviewViewModel: ObservableObject {
    @Published var video: TopPreviewableVideo & PlayableVideo
    
    init(video: TopPreviewableVideo & PlayableVideo) {
        self.video = video
    }
    
    var player: AVPlayer {
        get {
            PlayerState.shared.player
        }
        set {
            PlayerState.shared.player = newValue
        }
    }
    
    var videoIdOfCurrentlyPlayingItem: String? {
        get {
            PlayerState.shared.videoIdOfCurrentlyPlayingItem
        }
        set {
            PlayerState.shared.videoIdOfCurrentlyPlayingItem = newValue
        }
    }
    
    var contentHeight: CGFloat {
        if video.canUserWatch {
            return 180
        } else {
            if video.subscriptionForWatching != nil {
                return 300
            } else {
                return 240
            }
        }
    }
    
    func resetAndPlayVideo() {
        setPlayer()
        videoIdOfCurrentlyPlayingItem = video.videoId
        player.seek(to: .zero)
        player.play()
    }
    
    func resetAndPauseVideo() {
        setPlayer()
        videoIdOfCurrentlyPlayingItem = video.videoId
        player.seek(to: .zero)
        player.pause()
    }
    
    private func setPlayer() {
        guard let signedUrl = video.signedUrl else { return }
        let playerItem = AVPlayerItem(url: signedUrl)
        
        let titleItem = AVMutableMetadataItem()
        titleItem.identifier = .commonIdentifierTitle
        titleItem.value = NSString(string: video.title)
        
        let subtitleItem = AVMutableMetadataItem()
        subtitleItem.identifier = .iTunesMetadataTrackSubTitle
        subtitleItem.value = NSString(string: video.speakerName)
        
        playerItem.externalMetadata = [titleItem, subtitleItem]

        player = AVPlayer(playerItem: playerItem)
    }
}
