//
//  addToCartButton.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-31.
//

import SwiftUI

struct addToCartButton: View {
    @EnvironmentObject var modelData: ModelData
    var product: Product
    @State private var showingAlert = false
    @State private var activeAlert: Product.ActiveAlert = .first
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            if isSet == false {
                isSet.toggle()
                self.activeAlert = .first
                modelData.notificatonCart += 1
            } else {
                //modelData.quantity += 1
                self.activeAlert = .second
            }
            self.showingAlert = true
        }) {
            Text("Add to bag")
                .padding()
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 0))
                .foregroundColor(.primary)
                .background(Color.yellow)
                .cornerRadius(100)
        }
        .alert(isPresented: $showingAlert) {
            switch activeAlert {
            case .first:
                return Alert(title: Text("Item added to your Cart"), dismissButton: .default(Text("Got it!")))
            case .second:
                return Alert(title: Text("Item already in your cart"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
}

struct addToCartButton_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        addToCartButton(product: modelData.products[1], isSet: .constant(true))
            .environmentObject(ModelData())
    }
}
