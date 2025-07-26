//
//  AppCustomToolbar.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 31/07/2022.
//

import Foundation
import SwiftUI

struct AppCustomToolbar: View {
    @Binding var offset: CGFloat?
    @Binding var initialOffset: CGFloat?
    
    let userProfileImageUrl: URL?
    
    var body: some View {
        HStack(alignment: .center) {
            Image(
                systemName: "globe.asia.australia.fill"
            )
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .foregroundColor(Color(uiColor: .label))
            .padding(.leading)

            VStack {
                HStack {
                    Text("appNamePart1")
                        .font(
                            .custom("CinzelRoman-Bold", size: 22, relativeTo: .headline)
                            .smallCaps()
                        )
                        .foregroundColor(Color(uiColor: .label))
                    Spacer()
                }

                HStack {
                    Text("appNamePart2")
                        .font(
                            .custom("CinzelRoman-Bold", size: 15, relativeTo: .caption)
                            .smallCaps()
                        )
                        .foregroundColor(Color(uiColor: .label))
                    Spacer()
                }
            }
            
            Spacer()
            
            Button {

            } label: {
                AsyncImage(
                    url: userProfileImageUrl) { image in
                            image.resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                    } placeholder: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .tint(.accentColor)
                            .frame(width: 40, height: 40)
                    }
                    .padding()
            }
        }
        .frame(height: heightOfToolbar())
        .animation(.linear, value: 0)
    }
    
    private func heightOfToolbar() -> CGFloat {
        let maxHeight: CGFloat = 110
        let minHeight: CGFloat = 80
        let factor: CGFloat = 5
     
        guard let initialOffset = initialOffset,
              let offset = offset else {
            return maxHeight
        }
     
        if initialOffset > offset {
            let diff = initialOffset - offset
            if diff > 40 {
                return minHeight
            } else {
                let computed = maxHeight - (factor * diff)
                let height = (computed > minHeight && computed < maxHeight) ? computed : minHeight
                return height
            }
        }
     
        return maxHeight
    }
}

struct AppCustomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        AppCustomToolbar(offset: Binding.constant(0), initialOffset: Binding.constant(0), userProfileImageUrl: nil)
    }
}

struct OffsetKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}
