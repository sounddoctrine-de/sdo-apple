//
//  TogglableButton.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import SwiftUI

struct TogglableButton: View {
    var text: String
    
    var isOnImage: String
    var isOffImage: String
    
    var isOn: Bool
    
    var imageName: String {
        return isOn ? isOnImage : isOffImage
    }
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.accentColor)
                Text(text)
                    .foregroundColor(.accentColor)
                    .font(.sdoCallout)
                    .bold()
            }
        }
    }
}

struct TogglableButton_Previews: PreviewProvider {
    static var previews: some View {
        TogglableButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
            print("Tapped")
        }
    }
}
