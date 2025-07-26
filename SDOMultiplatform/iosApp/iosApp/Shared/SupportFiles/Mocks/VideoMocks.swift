//
//  VideoMocks.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation
import ComposeApp

let exampleVideo1 = HomeScreenData.HomeVideo(
    videoId: "dummy1",
    title: "Being Baptist",
    channelId: "dummy1",
    channelName: "Verity Baptist Church",
    datePublished: Date(timeIntervalSinceNow: -60000),
    speakerName: "Pastor Roger Jiminez",
    thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!
)

let exampleVideo2 = HomeScreenData.HomeVideo(
    videoId: "dummy2",
    title: "Being Baptist",
    channelId: "dummy1",
    channelName: "Verity Baptist Church",
    datePublished: Date(timeIntervalSinceNow: -60000),
    speakerName: "Pastor Roger Jiminez",
    thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!
)

let exampleVideoDetail1 = VideoDetailData(
    infoData: VideoDetailData.InfoData(
        videoId: "dummy1",
        title: "Being Baptist",
        videoType: .documentary,
        datePublished: Date(timeIntervalSinceNow: -60000),
        description: "Being Baptist traces the history from the historic anabaptists to the impact of the independent fundametal churches of today.",
        speaker: VideoDetailData.SpeakerData(speakerId: "dummy1", speakerName: "Pastor Roger Jimenez"),
        channel: ChannelData(
            channelId: "dummy1",
            channelName: "Verity Baptist Church",
            channelType: .church
        ),
        moreVideosInChannel: [
            VideoDetailData.RelatedVideo(
                videoId: "dummy1",
                title: "Once Saved Always Saved",
                channelId: "dummy12",
                channelName: "Faithful Word Baptist Church",
                datePublished: Date(timeIntervalSinceNow: -60000),
                speakerName: "Pastor Roger Jiminez",
                thumbnailURL: URL(
                    string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1"
                )!
            ),
            VideoDetailData.RelatedVideo(
                videoId: "dummy2",
                title: "1, 2, 3, Repent After Me",
                channelId: "dummy12",
                channelName: "Faithful Word Baptist Church",
                datePublished: Date(timeIntervalSinceNow: -60000),
                speakerName: "Pastor Roger Jiminez",
                thumbnailURL: URL(
                    string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1"
                )!
            )
        ],
        language: LanguageData(
            languageCode: "en",
            sourceCountryFlag: "🇬🇧"
        ),
        thumbnailURL: URL(
            string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1"
        )!,
        likedByUser: true
    ),
    videoUrl: nil,
    subscriptionVideoBelongsTo: SubscriptionData(
        subscriptionId: "dummy1",
        subscriptionName: "Verity Baptist",
        subscriptionCost: 199,
        currencyCode: "INR",
        eligibleForTrial: true,
        timeIntervalOfTrial: 2629748.16
    ),
    allAccessSubscription: SubscriptionData(
        subscriptionId: "dummy2",
        subscriptionName: "SDO All Access",
        subscriptionCost: 349,
        currencyCode: "INR",
        eligibleForTrial: true,
        timeIntervalOfTrial: 2629748.16
    )
)
