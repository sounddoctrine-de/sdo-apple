//
//  ProfileTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation
import SwiftUI
import ComposeApp

@MainActor
class ProfileTabViewModel: ObservableObject {
    private let getUserDataUseCase = GetUserDataUseCase(
        userRepository: HasuraUserRepository(
            graphQLService: HasuraGraphQLService()))
    
    @Published var userData: Result<UserData, BusinessError>?
    
    func onLoaded(user: SDOUser?) {
        guard let user else {
            userData = .failure(BusinessErrors.unknownError())
            return
        }
        if !user.isAnonymous {
            Task {
                switch await getUserDataUseCase.execute(userUuid: user.uid) {
                case let .success(data):
                    userData = .success(data)
                case let .failure(error):
                    AppLogger.error(error.localizedDescription)
                    userData = .failure(error)
                }
            }
        } else {
            userData = .failure(BusinessErrors.anonymousUserError())
        }
    }
}
