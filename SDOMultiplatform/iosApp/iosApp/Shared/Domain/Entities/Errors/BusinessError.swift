//
//  BusinessError.swift
//  SDO
//
//  Created by Joel Kingsley on 03/07/2022.
//

import Foundation

typealias BusinessError = Error

enum BusinessErrors: BusinessError {
    // Generic Errors
    struct serverError: BusinessError {}
    struct clientError: BusinessError {}
    struct noContent: BusinessError {}
    struct parsingError: BusinessError {}
    struct unknownError: BusinessError {}
    struct unauthorized: BusinessError {}
    struct unavailableError: BusinessError {}
    struct customError: BusinessError {
        let code: String
    }
    
    // User Errors
    struct anonymousUserError: BusinessError {}
}

extension BusinessErrors.serverError: LocalizedError {
    var errorDescription: String? {
        return "Server error"
    }
}

extension BusinessErrors.clientError: LocalizedError {
    var errorDescription: String? {
        return "Client error"
    }
}

extension BusinessErrors.noContent: LocalizedError {
    var errorDescription: String? {
        return "No Content"
    }
}

extension BusinessErrors.parsingError: LocalizedError {
    var errorDescription: String? {
        return "Parsing Error"
    }
}

extension BusinessErrors.unknownError: LocalizedError {
    var errorDescription: String? {
        return "Unknown Error"
    }
}

extension BusinessErrors.unauthorized: LocalizedError {
    var errorDescription: String? {
        return "Unauthorized Error"
    }
}

extension BusinessErrors.unavailableError: LocalizedError {
    var errorDescription: String? {
        return "Unavailable Error"
    }
}

extension BusinessErrors.customError: LocalizedError {
    var errorDescription: String? {
        return "Custom Error"
    }
}
