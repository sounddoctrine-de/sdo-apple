//
//  CustomErrorViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 05/09/2022.
//

import Foundation
import SwiftUI

class CustomErrorViewModel: ObservableObject {
    let error: BusinessError
    
    init(error: BusinessError) {
        self.error = error
    }
    
    var body: CustomErrorViewBody {
        switch error {
        case is BusinessErrors.serverError:
            return CustomErrorViewBody(
                title: "errorViewServerErrorTitle",
                description: "errorViewServerErrorDescription",
                primaryActionType: .tryAgain,
                secondaryActionType: .none
            )
        case is BusinessErrors.clientError:
            return CustomErrorViewBody(
                title: "errorViewClientErrorTitle",
                description: "errorViewClientErrorDescription",
                primaryActionType: .tryAgain,
                secondaryActionType: .none
            )
        case is BusinessErrors.noContent:
            return CustomErrorViewBody(
                title: "errorViewNoContentTitle",
                description: "errorViewNoContentDescription",
                primaryActionType: .tryAgain,
                secondaryActionType: .none
            )
        case is BusinessErrors.parsingError:
            return CustomErrorViewBody(
                title: "errorViewParsingErrorTitle",
                description: "errorViewParsingErrorDescription",
                primaryActionType: .tryAgain,
                secondaryActionType: .none
            )
        case is BusinessErrors.unauthorized:
            return CustomErrorViewBody(
                title: "errorViewUnauthorizedTitle",
                description: "errorViewUnauthorizedDescription",
                primaryActionType: .none,
                secondaryActionType: .none
            )
        case is BusinessErrors.unavailableError:
            return CustomErrorViewBody(
                title: "errorViewUnavailableTitle",
                description: "errorViewUnavailableDescription",
                primaryActionType: .none,
                secondaryActionType: .tryAgain
            )
        default:
            return CustomErrorViewBody(
                title: "errorViewUnknownErrorTitle",
                description: "errorViewUnknownErrorDescription",
                primaryActionType: .tryAgain,
                secondaryActionType: .none
            )
        }
    }
}

struct CustomErrorViewBody {
    let title: LocalizedStringKey
    let description: LocalizedStringKey
    let primaryActionType: CustomErrorActionType
    let secondaryActionType: CustomErrorActionType
}

enum CustomErrorActionType: LocalizedStringKey {
    case none
    case tryAgain = "errorViewTryAgainActionLabel"
    case reportIssue = "errorViewReportIssueActionLabel"
}
