//
//  GraphQLErrorTransformer.swift
//  SDO
//
//  Created by Joel Kingsley on 31/08/2022.
//

import Foundation
import Apollo

enum GraphQLErrorTransformer {
    static func transform(graphQLError: GraphQLError) -> ApiError {
        do {
            guard let graphQLErrorExtension = graphQLError.extensions else {
                return ApiErrors.serverError()
            }
            let jsonData = try JSONSerialization.data(withJSONObject: graphQLErrorExtension, options: [])
            let hasuraError = try JSONDecoder().decode(HasuraGraphQLErrorResponseDTO.self, from: jsonData)
            if let errorInternal = hasuraError.errorInternal,
                  let errorResponse = errorInternal.response,
                  let errorBody = errorResponse.body,
                  let error = errorBody.error,
                  let code = error.code {
                return ApiErrors.customError(code: code)
            } else if let errorInternal = hasuraError.errorInternal,
                      let errorResponse = errorInternal.response,
                      let status = errorResponse.status {
                switch status {
                case 204:
                    return ApiErrors.noContent()
                case 401:
                    return ApiErrors.unauthorized()
                case 400, 402 ... 499:
                    return ApiErrors.clientError()
                case 500 ... 502, 504 ... 599:
                    return ApiErrors.serverError()
                case 503:
                    return ApiErrors.unavailableError()
                default:
                    return ApiErrors.unknownError()
                }
            } else if let code = graphQLErrorExtension["code"] as? String,
                      let apiError = ApiErrorCodes(rawValue: code)?.toApiError() {
                return apiError
            }
            else {
                return ApiErrors.unknownError()
            }
        } catch {
            return ApiErrors.unknownError()
        }
    }
    
    static func transform(apiError: ApiError) -> BusinessError {
        switch apiError {
        case is ApiErrors.serverError:
            return BusinessErrors.serverError()
        case is ApiErrors.parsingError:
            return BusinessErrors.parsingError()
        case is ApiErrors.clientError:
            return BusinessErrors.clientError()
        case is ApiErrors.noContent:
            return BusinessErrors.noContent()
        case is ApiErrors.unavailableError:
            return BusinessErrors.unavailableError()
        case is ApiErrors.unauthorized:
            return BusinessErrors.unauthorized()
        case is ApiErrors.customError:
            let customError = apiError as! ApiErrors.customError
            return BusinessErrors.customError(code: customError.code)
        case is ApiErrors.unknownError:
            fallthrough
        default:
            return BusinessErrors.unknownError()
        }
    }
}
