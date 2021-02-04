//
//  CartDetailRow.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-01-16.
//

import SwiftUI

struct CartDetailRow: View {
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ProductRow(product: product)
            if product.extraOptions {
                Text(String(product.getExtraOrderString()))
            }
            HStack {
                Text("Total: \(product.getTotalOrderPrice(item: Double(product.price)), specifier: "%.2f")")
                Image(systemName:"dollarsign.circle.fill")
            }
            .offset(x: 260)
        }
    }
}

struct CartDetailRow_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        CartDetailRow(product: modelData.products[25])
            .environmentObject(modelData)
    }
}
