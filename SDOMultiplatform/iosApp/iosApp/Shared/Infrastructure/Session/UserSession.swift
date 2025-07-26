//
//  UserSession.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation
import FirebaseAuth
import ComposeApp

extension Key: CaseIterable {
    static var allCases: [Key] {
        return [.userPrimaryKey, .userUuid, .userEmail, .accessToken, .appleRefreshToken, .isAnonymousUser]
    }

    static let userPrimaryKey: Key = "userPrimaryKey"
    static let userUuid: Key = "userUuid"
    static let userEmail: Key = "userEmail"
    static let accessToken: Key = "accessToken"
    static let appleRefreshToken: Key = "appleRefreshToken"
    static let isAnonymousUser: Key = "isAnonymousUser"
}

enum UserSession {
    @UserDefault(key: .userPrimaryKey)
    public static var userPrimaryKey: String?
    
    @UserDefault(key: .userUuid)
    public static var userUuid: String?
    
    @UserDefault(key: .userEmail)
    public static var userEmail: String?
    
    @UserDefault(key: .accessToken)
    public static var accessToken: String?
    
    @UserDefault(key: .appleRefreshToken)
    public static var appleRefreshToken: String?
    
    @UserDefault(key: .isAnonymousUser)
    public static var isAnonymousUser: Bool?

    static func setUserData(userData: UserData) {
        userPrimaryKey = userData.id
        userUuid = userData.userUuid
        userEmail = userData.userEmail
    }
    
    static func setIsAnonymousUser(to value: Bool) {
        isAnonymousUser = value
    }
    
    static func setUserSession(user: SDOUser, forcingRefresh: Bool = false) async throws {
        let idToken = try await user.idTokenForcingRefresh(forcingRefresh)
        accessToken = idToken
    }

    static func setAppleTokens(refreshToken: String) {
        appleRefreshToken = refreshToken
    }
    
    static func clearSession() {
        Key.allCases.forEach { UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
}
