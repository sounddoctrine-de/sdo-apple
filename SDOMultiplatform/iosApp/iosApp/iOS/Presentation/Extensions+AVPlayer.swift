//
//  Extensions+AVPlayer.swift
//  SDO
//
//  Created by Joel Kingsley on 31/08/2022.
//

import AVKit

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
