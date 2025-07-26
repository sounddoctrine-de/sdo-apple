//
//  LanguageRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation
import ComposeApp

/**
 Repository that performs operations related to languages
 */
protocol LanguageRepository {
    /// Get all languages
    func getAllLanguages() async -> Result<[LanguageData], BusinessError>
}
