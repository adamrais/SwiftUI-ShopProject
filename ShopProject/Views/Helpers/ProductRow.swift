//
//  ProductRow.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-23.
//

import SwiftUI

struct ProductRow: View {
    var product: Product
    
    var body: some View {
        HStack {
            product.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(product.name)
            Spacer()
            Label(String(product.price) , systemImage: "dollarsign.circle")
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var products = ModelData().products
    static var previews: some View {
        Group {
            ProductRow(product: products[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
