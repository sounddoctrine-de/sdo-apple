//
//  ThumnailableVideo.swift
//  SDO
//
//  Created by Joel Kingsley on 25/08/2022.
//

import Foundation

protocol ThumbnailableVideo {
    var id: UUID { get }
    var title: String { get }
    var channelName: String { get }
    var thumbnailURL: URL { get }
    var datePublished: Date { get }
    var speakerName: String { get }
}
