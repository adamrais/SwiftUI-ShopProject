//
//  TagView.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-01-08.
//

import SwiftUI

struct TagView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var tags: Product.Tags = .milk
    @State private var defaultTag = "error"
    var product: Product
    
    var body: some View {
            if ((product.tag?.contains("Milk")) != nil) {
                HStack {
                    Text(product.tag ?? defaultTag)
                }
                .padding(8)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(15)
            } else if ((product.tag?.contains("Fruit")) != nil) {
                HStack {
                    Text(product.tag ?? defaultTag)
                }
                .padding(8)
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(15)
            } else {
                EmptyView()
            }
    }
}

struct Tag_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TagView(product: modelData.products[25])
        .environmentObject(modelData)
    }
}
