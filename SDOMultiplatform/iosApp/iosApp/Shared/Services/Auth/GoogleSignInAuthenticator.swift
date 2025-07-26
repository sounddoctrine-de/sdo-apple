//
//  GoogleSignInAuthenticator.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import SwiftUI
import GoogleSignIn

/// An observable class for authenticating via Google.
final class GoogleSignInAuthenticator: ObservableObject {
    #if os(iOS)
    private let clientID = "339443240109-d0v5vs4eqg7s9okddajsh6qbkfh9h6u8.apps.googleusercontent.com"
    #elseif os(macOS)
    private let clientID = "339443240109-d0v5vs4eqg7s9okddajsh6qbkfh9h6u8.apps.googleusercontent.com"
    #endif

    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: clientID)
    }()

    /// Signs in the user based upon the selected account.'
    /// - note: Successful calls to this will return the `GIDGoogleUser`
    func signIn() async throws -> GIDGoogleUser {
    #if os(iOS)
        guard let rootViewController = await UIApplication.shared.keyWindow?.rootViewController else {
            throw BusinessErrors.clientError()
        }
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    continuation.resume(with: .failure(BusinessErrors.clientError()))
                    return
                }
                GIDSignIn.sharedInstance.signIn(
                    with: self.configuration,
                    presenting: rootViewController
                ) { user, error in
                    guard let user = user else {
                        AppLogger.error(String(describing: error))
                        continuation.resume(with: .failure(BusinessErrors.serverError()))
                        return
                    }
                    continuation.resume(with: .success(user))
                }
            }
        }
    #elseif os(macOS)
        guard let presentingWindow = NSApplication.shared.windows.first else {
            AppLogger.error("There is no presenting window!")
            throw BusinessErrors.clientError()
        }
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    continuation.resume(with: .failure(BusinessErrors.clientError()))
                    return
                }
                GIDSignIn.sharedInstance.signIn(
                    with: self.configuration,
                    presenting: presentingWindow
                ) { user, error in
                    guard let user = user else {
                        AppLogger.error(String(describing: error))
                        continuation.resume(with: .failure(BusinessErrors.serverError()))
                        return
                    }
                    continuation.resume(with: .success(user))
                }
            }
        }
    #endif
  }

    /// Signs out the current user.
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }
}
