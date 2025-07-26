//
//  SDOUserInfo.swift
//  SDO
//
//  Created by Joel Kingsley on 25/11/2022.
//

import Foundation
import FirebaseAuth

private let AppleAuthProviderID = "apple.com"

/// Represents user data returned from an identity provider in the SDO app.
struct SDOUserInfo: Identifiable {
    var id: UUID {
        UUID(uuidString: providerId) ?? UUID()
    }
    
    let providerId: String
    
    var providerName: String {
        switch providerId {
        case GoogleAuthProviderID:
            return "Google"
        case AppleAuthProviderID:
            return "Apple"
        default:
            return "Unknown"
        }
    }
    
    var providerImageSystemName: String {
        switch providerId {
        case GoogleAuthProviderID:
            return "g.circle.fill"
        case AppleAuthProviderID:
            return "apple.logo"
        default:
            return "questionmark.circle"
        }
    }
    
    var identityProvider: SDOIdentityProvider? {
        switch providerId {
        case GoogleAuthProviderID:
            return .google
        case AppleAuthProviderID:
            return .apple
        default:
            return .none
        }
    }
}

extension UserInfo {
    func toEntity() -> SDOUserInfo {
        return SDOUserInfo(providerId: providerID)
    }
}

enum SDOIdentityProvider {
    case google
    case apple
}
