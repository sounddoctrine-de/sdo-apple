//
//  SDOAuthService.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation
import AuthenticationServices

protocol SDOAuthService {
    /// Restores current user session from keychain if valid
    func restorePreviousSignIn() async -> AuthState

    /// Signs in user with the Google sign-in
    func signInWithGoogle() async -> AuthState
    
    /// Configures the Apple sign-in authorization request
    func configure(appleSignInAuthorizationRequest: ASAuthorizationAppleIDRequest)
    
    /// Signs in user with the Apple sign-in
    func signInWithApple(requestAuthorizationResult result: Result<ASAuthorization, Error>) async -> (AuthState, String?)

    /// Signs in the user as an anonymous user
    func signInAnonymously() async -> AuthState

    /// Signs in to firebase using the given auth credentials
    /// - note: To be invoked after authenticating with username-password or social sign-in
    func signOut() -> Bool
    
    /// Deletes the user account from the authentication provider
    func deleteAccount() async -> Bool
    
    /// Gets a list of all social accounts connected to the user
    func getConnectedSocialAccounts() -> [SDOUserInfo]
}
