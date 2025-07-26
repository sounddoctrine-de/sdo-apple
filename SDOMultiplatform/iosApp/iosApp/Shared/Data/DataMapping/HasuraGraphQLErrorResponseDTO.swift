//
//  HasuraGraphQLErrorResponseDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 31/08/2022.
//

import Foundation

// MARK: - HasuraGraphQLErrorResponseDTO
struct HasuraGraphQLErrorResponseDTO: Codable {
    let errorInternal: Internal?
    
    struct Internal: Codable {
        let response: Response?
        
        struct Response: Codable {
            let body: ResponseBody?
            let headers: [Header]?
            let status: Int?
            
            struct ResponseBody: Codable {
                let error: Error?
                
                struct Error: Codable {
                    let code: String?
                    let errorObject: ErrorObject?
                    
                    struct ErrorObject: Codable {
                        let code, message: String
                    }
                }
            }
            
            struct Header: Codable {
                let name, value: String
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case errorInternal = "internal"
    }
}
