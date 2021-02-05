//
//  CartDetailRow.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-01-16.
//

import SwiftUI

struct CartDetailRow: View {
    @State private var boxType1: ModelData.boxType = .macarons
    @State private var boxType2: ModelData.boxType = .cupcakes
    @State private var bobaType: ModelData.boxType = .boba
    @SceneStorage("appearCount")
        private var appearCount = 1
    @Binding var subtotal: Double
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ProductRow(product: product)
            if product.category.rawValue.contains("Boba") {  Text(modelData.convertSizeToString(boxSize: modelData.bobaSize, boxType: bobaType)).fontWeight(.semibold).font(.system(.title3, design: .rounded))
            }
            if product.extraOptions {
                Divider()
                Text("Extra in your item").fontWeight(.semibold)
                Text(String(product.getExtraOrderString()))
            }
            
            HStack {
                Text("Total: \(getTotal(), specifier: "%.2f")")
                Image(systemName:"dollarsign.circle.fill")
            }
            .offset(x: 260)
            
        }.onAppear {
            if (!modelData.inCart.isEmpty) && (modelData.inCart.count == appearCount) {
                subtotal = getTotal()
                appearCount += 1
                print(" in cart count: \(appearCount)")
                print("in appear count:\(modelData.inCart.count)")
            }
        }
    }
    
    //bad practice but need this function here
    func getTotal() -> Double {
        return product.getTotalOrderPrice(item: Double(product.price))
    }
}

struct CartDetailRow_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        CartDetailRow(subtotal: .constant(0), product: modelData.products[25])
            .environmentObject(modelData)
    }
}
