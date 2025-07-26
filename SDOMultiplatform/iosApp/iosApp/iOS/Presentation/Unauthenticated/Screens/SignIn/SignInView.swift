//
//  SignInView.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import SwiftUI
import GoogleSignInSwift
import AuthenticationServices

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Image("Text Logo")
            .resizable()
            .frame(width: 80, height: 80, alignment: .center)
            .padding()
        Text("signInSubtitleLabel")
            .multilineTextAlignment(.center)
            .italic()
            .padding()
        
        Spacer()
        
        Text("signInReasonLabel")
            .multilineTextAlignment(.center)
            .padding()
        
        VStack {
            if colorScheme == .light {
                Button {
                    authViewModel.signInWithGoogle()
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
                }
                .signInWithAppleButtonStyle(.black)
                .frame(height: 45)
                .padding(.horizontal)
                .padding(.bottom)
            } else {
                Button {
                    authViewModel.signInWithGoogle()
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
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 45)
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            HStack {
                Spacer()
                Button {
                    authViewModel.signInAnonymously()
                } label: {
                    Text("signInSkipForNowLabel")
                        .font(.sdoCallout)
                        .underline()
                        .padding(.vertical)
                        .padding(.bottom)
                }
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
