//
//  InfiniteList.swift
//  SDO
//
//  Created by Joel Kingsley on 05/10/2022.
//

import SwiftUI

struct InfiniteList<Data, Content>: View where Data : RandomAccessCollection, Data.Element : Hashable, Content : View {
    
    @Binding var data: Data
    @Binding var isLoading: Bool
    let loadMore: () -> Void
    let content: (Data.Element) -> Content
    
    init(
        data: Binding<Data>,
        isLoading: Binding<Bool>,
        loadMore: @escaping () -> Void,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        _data = data
        _isLoading = isLoading
        self.loadMore = loadMore
        self.content = content
      }
    
    var body: some View {
        VStack {
            ForEach(data, id: \.self) { item in
                content(item)
                    .onAppear {
                        if item == data.last {
                            loadMore()
                        }
                    }
            }
            if isLoading {
                ProgressView()
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct InfiniteList_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteList(data: Binding.constant([1,2,3]), isLoading: Binding.constant(false), loadMore: {
            
        }) { _ in
            
        }
    }
}
