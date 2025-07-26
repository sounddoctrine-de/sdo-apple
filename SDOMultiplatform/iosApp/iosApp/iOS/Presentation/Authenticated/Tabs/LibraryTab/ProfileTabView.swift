//
//  ProfileTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI
import Kingfisher

struct ProfileTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var profileTabViewModel = ProfileTabViewModel()
    
    var body: some View {
        if let userData = profileTabViewModel.userData {
            ScrollView {
                VStack {
                    switch userData {
                    case let .success(data):
                        VStack {
                            Text("profileLoggedInAsLabel")
                                .font(.sdoCaption)
                            Text(data.userEmail)
                                .font(.sdoCallout)
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                    case let .failure(error):
                        if ((error as? BusinessErrors.anonymousUserError) != nil) {
                            VStack {
                                Text("profileNotLoggedInLabel")
                                    .font(.sdoCallout)
                                    .listRowSeparator(.hidden)
                                    .padding(.bottom)
                                Text("profileVisitMyAccountLabel")
                                    .font(.sdoCallout)
                                    .listRowSeparator(.hidden)
                            }
                            .padding(.vertical, 20)
                        } else {
                            Text("profileLoggedInLabel")
                                .font(.sdoCallout)
                                .listRowSeparator(.hidden)
                                .padding(.vertical, 20)
                        }
                    }
                    
                    VStack {
                        NavigationLink {
                            MyAccountView()
                        } label: {
                            VStack {
                                HStack {
                                    Image(systemName: "person.crop.circle.fill")
                                        .padding(.horizontal, 5)
                                    Text("profileMyAccountOptionLabel")
                                        .font(.sdoBody)
                                    Spacer()
                                }
                                Divider()
                            }
                        }

                        NavigationLink {
                            AboutTheAppView()
                        } label: {
                            VStack {
                                HStack {
                                    Image(systemName: "info.circle.fill")
                                        .padding(.horizontal, 5)
                                    Text("profileAboutOptionLabel")
                                        .font(.sdoBody)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                    
                    if case let .signedIn(user) = authViewModel.state,
                       user.isAnonymous
                    {
                        ActionButton(
                            customFont: .sdoTitle2, text: "profileLeaveAppLabel") {
                                authViewModel.signOut()
                        }
                        .frame(width: 250)
                        .padding()
                    } else {
                        ActionButton(
                            customFont: .sdoTitle2, text: "profileSignOutLabel") {
                                authViewModel.signOut()
                        }
                        .frame(width: 250)
                        .padding()
                    }
                }
                .navigationBarTitle(Text("profileScreenTitle", comment: "Label: Navigation bar title of Profile Screen"))
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    // Load user data if anonymous user has logged in
                    if case let .failure(error) = userData,
                       (error as? BusinessErrors.anonymousUserError) != nil,
                       case let .signedIn(user) = authViewModel.state,
                       !user.isAnonymous
                    {
                        profileTabViewModel.onLoaded(user: authViewModel.getUser())
                    }
                }
            }
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    // Load user data if rendering first time after log in
                    profileTabViewModel.onLoaded(user: authViewModel.getUser())
                }
        }
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView()
    }
}
