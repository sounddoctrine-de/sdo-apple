//
//  MyAccountView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 24/11/2022.
//

import SwiftUI

struct MyAccountView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    @State private var isShowingSignInSheet = false
    @State private var showingConfirmationAlert = false
    @State private var showingSuccessfulDeletionAlert = false
    @State private var showingUnsuccessfulDeletionAlert = false
    @State private var isLoading = false
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView("progressViewLoadingLabel")
                    .progressViewStyle(.circular)
                    .navigationBarTitle(Text("myAccountLabel", comment: "Label: Navigation bar title of My Account Screen"))
                .navigationBarTitleDisplayMode(.inline)
            } else {
                if case let .signedIn(user) = authViewModel.state,
                   user.isAnonymous
                {
                    ScrollView {
                        VStack {
                            Text("signInReasonLabel")
                                .multilineTextAlignment(.center)
                                .padding()
                            ActionButton(customFont: .sdoTitle3, text: "myAccountRegisterSignInButtonLabel") {
                                isShowingSignInSheet = true
                            }
                            .frame(width: 250)
                        }
                    }
                    .sheet(isPresented: $isShowingSignInSheet) {
                        SignInSheetView()
                            .presentationDetents([.height(250)])
                            .presentationDragIndicator(.visible)
                    }
                    .navigationBarTitle(Text("myAccountLabel", comment: "Label: Navigation bar title of My Account Screen"))
                    .navigationBarTitleDisplayMode(.inline)
                } else {
                    ScrollView {
                        VStack {
                            Text("myAccountConnectedAccountsLabel")
                                .font(.sdoTitle3)
                                .bold()
                                .padding()

                            VStack {
                                ForEach(authViewModel.getConnectedSocialAccounts()) { userInfo in
                                    VStack {
                                        HStack {
                                            Image(systemName: userInfo.providerImageSystemName)
                                                .padding(.horizontal, 5)
                                            Text(userInfo.providerName)
                                                .font(.sdoBody)
                                            Spacer()
                                        }
                                        Divider()
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 30)

                            ActionButton(
                                customFont: .sdoTitle2, text: "myAccountDeleteAccountLabel", backgroundColor: Color(uiColor: .systemRed)) {
                                    showingConfirmationAlert = true
                            }
                            .frame(width: 250)
                            .padding()
                            .alert("myAccountConfirmDeleteText", isPresented: $showingConfirmationAlert) {
                                Button("myAccountYesOptionLabel", role: .destructive) {
                                    Task {
                                        isLoading = true
                                        if await authViewModel.deleteUser() {
                                            showingSuccessfulDeletionAlert = true
                                        } else {
                                            showingUnsuccessfulDeletionAlert = true
                                        }
                                        isLoading = false
                                    }
                                }
                                Button("myAccountNoOptionLabel", role: .cancel) {}
                            }
                            .alert("myAccountSuccessfulDeletionAlertLabel", isPresented: $showingSuccessfulDeletionAlert, actions: {
                                Button("OK", role: .cancel) {
                                    authViewModel.signOut()
                                }
                            })
                            .alert("myAccountUnsuccessfulDeletionAlertLabel", isPresented: $showingUnsuccessfulDeletionAlert, actions: {
                                Button("OK", role: .cancel) {
                                    authViewModel.signOut()
                                }
                            })
                            .padding(.vertical, 20)
                            
                            Spacer()
                        }
                        .navigationBarTitle(Text("myAccountLabel", comment: "Label: Navigation bar title of My Account Screen"))
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        }
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
