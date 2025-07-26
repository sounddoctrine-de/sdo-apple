//
//  TileButton.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 30/07/2022.
//

import SwiftUI

struct TileButton: View {
    
    let text: LocalizedStringKey
    
    let imageName: String
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                LinearGradient(
                    colors: [
                        Color.purple,
                        Color.blue
                    ],
                    startPoint: .topLeading,
                    endPoint: .trailing)
                .opacity(0.5)
                
                HStack {
                    VStack {
                        Spacer()
                        Text(text)
                            .font(.sdoCallout)
                            .bold()
                            .padding()
                    }
                    Spacer()
                }
                .layoutPriority(1)
            }
            .frame(height: 80)
        }
        .foregroundColor(Color(uiColor: .white))
        .cornerRadius(5)
    }
}

struct TileButton_Previews: PreviewProvider {
    static var previews: some View {
        TileButton(text: "Channels", imageName: "shorts") {}
    }
}
