//
//  GetAllLanguagesUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation
import ComposeApp

class GetAllLanguagesUseCase {
    let languageRepository: LanguageRepository
    
    init(languageRepository: LanguageRepository) {
        self.languageRepository = languageRepository
    }
    
    func execute() async -> Result<[LanguageData], BusinessError> {
        do {
            let languages = try await languageRepository.getAllLanguages().get()
            return .success(languages)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetAllLanguagesUseCase())
            }
            return .failure(error)
        }
    }
}
