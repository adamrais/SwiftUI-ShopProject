//
//  ClearCartButton.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-02-04.
//

import SwiftUI

struct ClearCartButton: View {
    @EnvironmentObject var modelData: ModelData
    //var product: Product
    //@State private var showingAlert = false
    //@State private var activeAlert: Product.ActiveAlert = .first
    @Binding var clearCart: Bool
    var body: some View {
        Button(action: {
                clearCart.toggle()
                //modelData.notificatonCart -= 1
        }) {
            labelCheckout(text: "Clear cart", color: .white)
        }
    }
}

struct ClearCartButton_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ClearCartButton(clearCart: .constant(true))
        .environmentObject(ModelData())
    }
}
