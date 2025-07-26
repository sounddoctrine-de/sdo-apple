//
//  DeleteAllUserDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 28/11/2022.
//

import Foundation

extension DeleteAllUserDataMutation.Data {
    func toEntity() throws -> DeleteAllUserData {
        guard let deleteUserByPk else {
            throw BusinessErrors.parsingError()
        }
        
        return DeleteAllUserData(
            userEmail: deleteUserByPk.userEmail,
            userUuid: deleteUserByPk.userUuid
        )
    }
}
