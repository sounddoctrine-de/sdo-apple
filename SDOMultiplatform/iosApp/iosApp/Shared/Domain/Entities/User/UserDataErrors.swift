//
//  UserDataErrors.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

extension BusinessErrors.customError {
    func asErrorForGetUserDataUseCase() -> BusinessError {
        BusinessErrors.serverError()
    }
}

extension BusinessErrors.customError {
    func asErrorForDeleteAllUserDataUseCase() -> BusinessError {
        BusinessErrors.serverError()
    }
}
