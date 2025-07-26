//
//  SignInSheetView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 18.07.23.
//

import SwiftUI
import AuthenticationServices

struct SignInSheetView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    var showFeatureNeedsAnAccountToWork: Bool = false

    var body: some View {
        VStack {
            if showFeatureNeedsAnAccountToWork {
                HStack {
                    Spacer()
                    Text("signInFeatureNeedsAccountToWorkLabel")
                        .multilineTextAlignment(.center)
                        .font(.sdoCaption)
                    Spacer()
                }
                .padding(.top, 20)
                
                HStack {
                    Spacer()
                    Text("signInFeatureNeedsAccountToWorkHintLabel")
                        .multilineTextAlignment(.center)
                        .font(.sdoCaption)
                    Spacer()
                }
            }
            
            HStack {
                Spacer()
                Text("signInWaysToSignIn")
                    .font(.sdoTitle2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
            
            if colorScheme == .light {
                Button {
                    authViewModel.signInWithGoogle()
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Image("Google Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Text("signInWithGoogleLabel")
                            .font(.custom("Gill Sans", size: 20))
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    .frame(height: 45)
                    .background(.white)
                    .cornerRadius(7)
                    .buttonBorderShape(.roundedRectangle(radius: 7))
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding()
                }
                
                SignInWithAppleButton(.signIn) { aSAuthorizationAppleIdRequest in
                   authViewModel.configure(appleSignInAuthorizationRequest: aSAuthorizationAppleIdRequest)
                } onCompletion: { result in
                    authViewModel.signInWithApple(requestAuthorizationResult: result)
                    dismiss()
                }
                .signInWithAppleButtonStyle(.black)
                .frame(height: 45)
                .padding(.horizontal)
                .padding(.bottom)
            } else {
                Button {
                    authViewModel.signInWithGoogle()
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Image("Google Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        Text("signInWithGoogleLabel")
                            .font(.custom("Gill Sans", size: 20))
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    .frame(height: 45)
                    .background(.white)
                    .cornerRadius(7)
                    .buttonBorderShape(.roundedRectangle(radius: 7))
                    .padding()
                }
                
                SignInWithAppleButton(.signIn) { aSAuthorizationAppleIdRequest in
                   authViewModel.configure(appleSignInAuthorizationRequest: aSAuthorizationAppleIdRequest)
                } onCompletion: { result in
                    authViewModel.signInWithApple(requestAuthorizationResult: result)
                    dismiss()
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 45)
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct SignInSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SignInSheetView()
    }
}
