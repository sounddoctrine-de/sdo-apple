//
//  CustomErrorView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 05/09/2022.
//

import SwiftUI

struct CustomErrorView: View {
    @ObservedObject var customErrorViewModel: CustomErrorViewModel
    let authViewModel: AuthenticationViewModel
    let tryAgainHandler: (() -> ())
    let reportIssueHandler: (() -> ())
    
    init(
        error: BusinessError,
        authViewModel: AuthenticationViewModel,
        tryAgainHandler: @escaping (() -> ()) = {}
    ) {
        self.customErrorViewModel = CustomErrorViewModel(error: error)
        self.authViewModel = authViewModel
        self.tryAgainHandler = tryAgainHandler
        self.reportIssueHandler = {}
    }
    
    var body: some View {
        VStack {
            Text(customErrorViewModel.body.title)
                .font(.sdoTitle)
            Text(customErrorViewModel.body.description)
                .multilineTextAlignment(.center)
            if customErrorViewModel.body.primaryActionType != .none {
                ActionButton(
                    imageName: nil,
                    customFont: .sdoTitle3,
                    text: customErrorViewModel.body.primaryActionType.rawValue,
                    backgroundColor: .accentColor
                ) {
                    switch customErrorViewModel.body.primaryActionType {
                    case .tryAgain:
                        tryAgainHandler()
                    case .reportIssue:
                        reportIssueHandler()
                    case .none:
                        break
                    }
                }
            }
            if customErrorViewModel.body.secondaryActionType != .none {
                ActionButton(
                    imageName: nil,
                    customFont: .sdoTitle3,
                    text: customErrorViewModel.body.secondaryActionType.rawValue
                ) {
                    switch customErrorViewModel.body.secondaryActionType {
                    case .tryAgain:
                        tryAgainHandler()
                    case .reportIssue:
                        reportIssueHandler()
                    case .none:
                        break
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .onAppear {
            if customErrorViewModel.error is BusinessErrors.unauthorized {
                authViewModel.signOut()
            }
        }
    }
}

struct CustomErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CustomErrorView(
            error: BusinessErrors.unauthorized(),
            authViewModel: AuthenticationViewModel()
        )
    }
}
