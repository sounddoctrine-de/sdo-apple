//
//  GetSignedUrlOfVideoDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

extension GetVideoUrlDataMutation.Data {
    func toEntity() throws -> URL? {
        return URL(string: getVideoUrlData.videoUrl)
    }
}
