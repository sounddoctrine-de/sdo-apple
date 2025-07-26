//
//  DeleteAllUserDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 30/11/2022.
//

import Foundation

class DeleteAllUserDataUseCase {
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(userPrimaryKey: String) async -> Result<DeleteAllUserData, BusinessError> {
        do {
            let data = try await userRepository.deleteAllUserData(userPrimaryKey: userPrimaryKey).get()
            return .success(data)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForDeleteAllUserDataUseCase())
            }
            return .failure(error)
        }
    }
}
