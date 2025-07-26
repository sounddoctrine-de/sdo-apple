//
//  VideoRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 24/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Videos
 */
protocol VideoRepository {
    /// Gets the data needed for the home screen
    func getHomeScreenData() async -> Result<HomeScreenData, BusinessError>
    
    /// Gets detailed informational video data
    func getVideoDetailData(
        videoId: String, channelId: String, userUuid: String) async -> Result<VideoDetailData.InfoData, BusinessError>
    
    /// Gets signed url of given video
    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<URL?, BusinessError>
    
    /// Gets the videos based on the given search parameters
    func getVideosOfSearchParameters(
        ofSearchResultInputData inputData: SearchResultInputData) async -> Result<SearchResultData, BusinessError>
    
    /// Updates the video's like/dislike status for given user
    func updateVideoLikeDislikeStatus(
        withPayload payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, BusinessError>
}
