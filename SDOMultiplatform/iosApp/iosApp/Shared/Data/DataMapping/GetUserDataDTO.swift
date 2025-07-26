//
//  GetUserDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation
import ComposeApp

extension GetUserDataQuery.Data {
    func toEntity() throws -> UserData {
        guard let user = user.first else {
            throw BusinessErrors.parsingError()
        }
        return UserData(
            id: user.id,
            userUuid: user.userUuid,
            userEmail: user.userEmail
        )
    }
}
