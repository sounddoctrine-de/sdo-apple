//
//  SDOVideoPlayer.swift
//  SDO
//
//  Created by Joel Kingsley on 31/08/2022.
//

import SwiftUI
import AVFoundation
import AVKit

// MARK: - SDOVideoPlayer

/// SDO's SwiftUI video player that uses `AVKit` and `AVFoundation` in the background
struct SDOVideoPlayer: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    public typealias TransitionCompletion = (AVPlayerViewController, UIViewControllerTransitionCoordinator) -> Void
    
    let player: AVPlayer
    
    public init(
        player: AVPlayer
    ) {
        self.player = player
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        player.allowsExternalPlayback = true
        player.audiovisualBackgroundPlaybackPolicy = .automatic
        controller.player = player
        controller.delegate = context.coordinator
        controller.modalPresentationStyle = .automatic
        controller.canStartPictureInPictureAutomaticallyFromInline = true
        controller.entersFullScreenWhenPlaybackBegins = false
        controller.exitsFullScreenWhenPlaybackEnds = false
        controller.allowsPictureInPicturePlayback = true
        controller.showsPlaybackControls = true
        controller.restoresFocusAfterTransition = true
        controller.updatesNowPlayingInfoCenter = true
        
        replaceRunningPlayerViewController(with: controller)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
    
    func makeCoordinator() -> SDOVideoPlayerCoordinator {
        SDOVideoPlayerCoordinator(self)
    }
    
    private func replaceRunningPlayerViewController(with playerViewController: AVPlayerViewController) {
        PlayerState.shared.playerViewControllerReference?.player?.pause()
        PlayerState.shared.playerViewControllerReference = playerViewController
    }
}

// MARK: - SDOVideoPlayerCoordinator

public class SDOVideoPlayerCoordinator: NSObject {
    var parent: SDOVideoPlayer
    var playerViewController: AVPlayerViewController?

    init(_ parent: SDOVideoPlayer) {
        self.parent = parent
    }
}

// MARK: - AVPlayerViewControllerDelegate

extension SDOVideoPlayerCoordinator: AVPlayerViewControllerDelegate {
    public func playerViewController(
        _ playerViewController: AVPlayerViewController,
        willBeginFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator
    ) {
        let isPlaying = playerViewController.player?.isPlaying ?? false
        coordinator.animate(alongsideTransition: nil) { context in
            // Add coordinated animations
            if context.isCancelled {
                // Still embedded inline
            } else {
                // Presented full screen
                // Take strong reference to playerViewController if needed
            }
            if isPlaying {
                playerViewController.player?.play()
            }
        }
    }
    
    public func playerViewController(
        _ playerViewController: AVPlayerViewController,
        willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator
    ) {
        let isPlaying = playerViewController.player?.isPlaying ?? false
        coordinator.animate(alongsideTransition: nil) { context in
            // Add coordinated animations
            if context.isCancelled {
                // Still full screen
            } else {
                // Embedded inline
                // Remove strong reference to playerViewController if held
            }
            if isPlaying {
                playerViewController.player?.play()
            }
        }
    }
    
    public func playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart(_ playerViewController: AVPlayerViewController) -> Bool {
        return false
    }
    
    public func playerViewController(
        _ playerViewController: AVPlayerViewController,
        restoreUserInterfaceForFullScreenExitWithCompletionHandler completionHandler: @escaping (Bool) -> Void
    ) {
        completionHandler(true)
    }
    
    public func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        PlayerState.shared.isPiP = true
    }
    
    public func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        PlayerState.shared.isPiP = false
    }
}

