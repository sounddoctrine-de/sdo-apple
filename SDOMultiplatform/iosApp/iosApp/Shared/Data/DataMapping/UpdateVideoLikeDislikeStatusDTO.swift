//
//  UpdateVideoLikeDislikeStatusDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

extension UpdateVideoAsLikedByUserMutation.Data {
    func toEntity() throws -> UpdateVideoLikeDislikeResponseData {
        guard let insertUserLikedVideosOne,
              !insertUserLikedVideosOne.a.isEmpty,
              !insertUserLikedVideosOne.b.isEmpty
        else {
            throw BusinessErrors.parsingError()
        }
        return UpdateVideoLikeDislikeResponseData(liked: true)
    }
}

extension UpdateVideoAsDislikedByUserMutation.Data {
    func toEntity() throws -> UpdateVideoLikeDislikeResponseData {
        guard let insertUserDislikedVideosOne,
              !insertUserDislikedVideosOne.a.isEmpty,
              !insertUserDislikedVideosOne.b.isEmpty
        else {
            throw BusinessErrors.parsingError()
        }
        return UpdateVideoLikeDislikeResponseData(liked: false)
    }
}

extension DeleteVideoLikeStatusForUserMutation.Data {
    func toEntity() -> UpdateVideoLikeDislikeResponseData {
        return UpdateVideoLikeDislikeResponseData(liked: nil)
    }
}
