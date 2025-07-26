//
//  PlayerState.swift
//  SDO
//
//  Created by Joel Kingsley on 25/10/2022.
//

import Foundation
import SwiftUI
import AVKit

/// The global video player state
class PlayerState: ObservableObject {
    /// The singleton state object for the player
    @ObservedObject public static var shared = PlayerState.init()

    private init() {}

    /// The current `AVPlayer`
    @Published public var player = AVPlayer()

    /// The `videoId` of the item that is currently playing
    @Published public var videoIdOfCurrentlyPlayingItem: String?

    /// Whether the current item is playing in picture-in-picture mode
    @Published public var isPiP = false

    /// Weak reference to the `AVPlayerViewController` which is playing the current item
    public weak var playerViewControllerReference: AVPlayerViewController?

    /// Pauses the video if it is playing in embedded mode
    public func stopVideoIfPlayingAsEmbedded() {
        if !isPiP && !player.isExternalPlaybackActive {
            player.pause()
        }
    }
}
