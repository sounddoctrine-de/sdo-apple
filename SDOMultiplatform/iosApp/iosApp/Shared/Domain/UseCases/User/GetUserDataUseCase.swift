//
//  GetUserDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation
import ComposeApp

class GetUserDataUseCase {
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(userUuid: String) async -> Result<UserData, BusinessError> {
        do {
            let user = try await userRepository.getUserData(userUuid: userUuid).get()
            return .success(user)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetUserDataUseCase())
            }
            return .failure(error)
        }
    }
}
