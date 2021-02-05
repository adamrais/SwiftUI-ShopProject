//
//  QuantityStepper.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-01-15.
//

import SwiftUI

struct QuantityStepper: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var quantity: Int
    @State private var quantities: Int = 0
    var product: Product
    
    var body: some View {
        HStack {
             Text("Quantity")
                 .font(.title3)
                 .bold()
             Stepper(value: $quantity, in: 0...20) {
                Text("\(quantity)")
                     .font(.title2)
             }
        }
    }
}

struct QuantityStepper_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        QuantityStepper(quantity: .constant(5), product: modelData.products[13])
        .environmentObject(modelData)
    }
}
