//
//  FirebaseAuthService.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices
import CryptoKit

class FirebaseAuthService: SDOAuthService {
    public static let shared = FirebaseAuthService()
    
    private let googleSignInAuthenticator: GoogleSignInAuthenticator
    
    private init() {
        self.googleSignInAuthenticator = GoogleSignInAuthenticator()
    }
    
    // MARK: - Properties
    
    // Unhashed nonce.
    private var currentNonce: String?
    
    // MARK: - Methods
    
    /// Restores current user session from keychain if valid
    @MainActor
    func restorePreviousSignIn() async -> AuthState {
        return await withCheckedContinuation { continuation in
            if let currentUser = Auth.auth().currentUser {
                AppLogger.debug("Restoring previous sign in")
                continuation.resume(returning: .signedIn(currentUser))
            } else {
                AppLogger.debug("Could not restore previous sign in")
                continuation.resume(returning: .signedOut)
            }
        }
    }
    
    /// Signs in user with the Google sign-in (pop-up) and then signs in on Firebase
    @MainActor
    func signInWithGoogle() async -> AuthState {
        do {
            let user: GIDGoogleUser = try await googleSignInAuthenticator.signIn()
            guard let idToken = user.idToken?.tokenString else {
                return .signedOut
            }
            let accessToken = user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: accessToken
            )
            return await signInOnFirebase(with: credential)
        } catch {
            AppLogger.error("Unexpectedly got error while signing in with Google: \(error)")
            return .signedOut
        }
    }
    
    /// Configures the Apple sign-in authorization request
    @MainActor
    func configure(appleSignInAuthorizationRequest request: ASAuthorizationAppleIDRequest) {
        let nonce = randomNonceString()
        currentNonce = nonce
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
    }
    
    /// Uses authorization credentials for from Apple sign-in to sign in on Firebase
    @MainActor
    func signInWithApple(requestAuthorizationResult result: Result<ASAuthorization, Error>) async -> (AuthState, String?) {
        switch result {
        case let .success(authorization):
            switch authorization.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                // Get name, email, and token from apple ID credentials
                let userIdentifier = appleIDCredential.user
                let displayName: String? = {
                    if let fullName = appleIDCredential.fullName {
                        var name = ""
                        if let givenName = fullName.givenName {
                            name.append(givenName)
                            if let familyName = fullName.familyName {
                                name.append(" " + familyName)
                            }
                        } else if let familyName = fullName.familyName {
                            name.append(familyName)
                        }
                        return name
                    }
                    return nil
                }()
                let email = String(describing: appleIDCredential.email)
                AppLogger.debug(
                    "Signed in with Apple: \(userIdentifier), \(String(describing: displayName)), \(email)")
                
                guard let nonce = currentNonce else {
                    AppLogger.error("Invalid state: A login callback was received, but no login request was sent.")
                    return (.signedOut, nil)
                }
                
                guard let idToken = appleIDCredential.identityToken else {
                    AppLogger.error("Unable to fetch identity token")
                    return (.signedOut, nil)
                }
                
                guard let idTokenString = String(data: idToken, encoding: .utf8) else {
                    AppLogger.error("Unable to serialize token string from data: \(idToken.debugDescription)")
                    return (.signedOut, nil)
                }
                
                // Initialize a Firebase credential.
                var personNameComponents: PersonNameComponents? = nil
                if let displayName {
                    personNameComponents = try? PersonNameComponents(displayName)
                }
                let credential = OAuthProvider.appleCredential(withIDToken: idTokenString, rawNonce: nonce, fullName: personNameComponents)
                
                // Check and return Apple authorization code
                var codeString: String?
                if let authorizationCode = appleIDCredential.authorizationCode {
                    codeString = String(data: authorizationCode, encoding: .utf8)
                }
                let authState = await signInOnFirebase(with: credential)
                if case let .signedIn(user) = authState,
                   let displayName
                {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = displayName
                    try? await changeRequest.commitChanges()
                }
                return (authState, codeString)
            default:
                AppLogger.error("Unexpected credential error while signing in with Apple")
                return (.signedOut, nil)
            }
        case let .failure(error):
            AppLogger.error("Unexpectedly got error while signing in with Apple: \(error)")
            return (.signedOut, nil)
        }
    }

    /// Signs in to firebase as an anonymous user
    @MainActor
    func signInAnonymously() async -> AuthState {
        do {
            let authDataResult = try await Auth.auth().signInAnonymously()
            let user = authDataResult.user
            return .signedIn(user)
        } catch {
            AppLogger.error("Unexpectedly got error while signing in anonymously with firebase: \(error)")
            return .signedOut
        }
    }

    /// Signs in to firebase using the given auth credentials
    /// - note: To be invoked after authenticating with username-password or social sign-in
    @MainActor
    private func signInOnFirebase(with credential: AuthCredential) async -> AuthState {
        do {
            let authDataResult = try await Auth.auth().signIn(with: credential)
            let user = authDataResult.user
            return .signedIn(user)
        } catch {
            AppLogger.error("Unexpectedly got error while signing in with firebase: \(error)")
            return .signedOut
        }
    }
    
    /// Signs in user out of all authenticators and firebase
    @MainActor
    func signOut() -> Bool {
        do {
            googleSignInAuthenticator.signOut()
            try Auth.auth().signOut()
            return true
        } catch {
            AppLogger.error("Encountered error signing out: \(error).")
            return false
        }
    }
    
    /// Deletes the user account from the authentication provider
    @MainActor
    func deleteAccount() async -> Bool {
        do {
            guard let currentUser = Auth.auth().currentUser else {
                AppLogger.error("Unsuccessful in deleting user account since 'currentUser' is nil")
                return false
            }
            try await currentUser.delete()
            AppLogger.debug("Successfully deleted user in Firebase")
            return true
        } catch {
            AppLogger.error("Unsuccessful in deleting user account: \(error)")
            return false
        }
    }
    
    /// Gets a list of all social accounts connected to the user
    @MainActor
    func getConnectedSocialAccounts() -> [SDOUserInfo] {
        return Auth.auth().currentUser?.providerData.map({ userInfo in
            SDOUserInfo(providerId: userInfo.providerID)
        }) ?? []
    }
}

// MARK: - Crytographic algorithms

extension FirebaseAuthService {
    /// Generates a random nonce string
    /// - note: Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    /// Hash using SHA256
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
}

