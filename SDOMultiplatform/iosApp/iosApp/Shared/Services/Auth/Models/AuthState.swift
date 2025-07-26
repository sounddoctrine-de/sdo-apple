//
//  AuthState.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 15/07/2022.
//

import Foundation
import FirebaseAuth

/// An enumeration representing logged in status.
enum AuthState: Equatable {
/// The user is logged in and is the associated value of this case.
case signedIn(SDOUser)
/// The user is logged out.
case signedOut
/// The user status is being loaded
case loading
}
