//
//  QueryTag.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 15/06/2022.
//

import SwiftUI

struct QueryTag: View {
    var query: String
    var isSelected: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: "Salvation", isSelected: true)
    }
}
