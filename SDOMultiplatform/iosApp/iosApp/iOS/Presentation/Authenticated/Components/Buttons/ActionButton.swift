//
//  ActionButton.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import SwiftUI

struct ActionButton: View {
    var imageName: String?
    
    var customFont: Font?
    
    var text: LocalizedStringKey
    
    var textColor = Color(uiColor: .systemBackground)
    
    var backgroundColor = Color(uiColor: .label)
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .font(.sdoHeadline)
                }
                
                Text(text)
                    .font(customFont)
                    .bold()
                    .allowsTightening(true)
                
                Spacer()
            }
            .frame(height: 40)
        }
        .padding(.vertical, 6)
        .foregroundColor(textColor)
        .background(backgroundColor)
        .cornerRadius(10)
    }

}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(imageName: "play.fill", text: "Play") {
            print("Tapped")
        }
    }
}
