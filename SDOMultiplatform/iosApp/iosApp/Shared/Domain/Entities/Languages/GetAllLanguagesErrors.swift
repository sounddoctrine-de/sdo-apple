//
//  GetAllLanguagesErrors.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

extension BusinessErrors.customError {
    func asErrorForGetAllLanguagesUseCase() -> BusinessError {
        BusinessErrors.serverError()
    }
}
