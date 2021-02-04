//
//  CartDetailView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-29.
//

import SwiftUI

struct CartDetailView: View {
    @State private var showCartItemsOnly = true
    @State private var emptyCart = false
    @State private var boxType1: ModelData.boxType = .macarons
    @State private var boxType2: ModelData.boxType = .cupcakes
    @State private var bobaType: ModelData.boxType = .boba
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentation
    
    var itemInCart: [Product] {
        modelData.products.filter { product in
            (!showCartItemsOnly || product.isInCart)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("CartBackground")
                    .resizable()
                    .scaledToFit()
                
                if itemInCart.count == 0 {
                    Text("No item in cart")
                    //self.emptyCart = true
                }
                List {
                    ForEach(itemInCart) { product in
                            CartDetailRow(product: product)
//                        HStack {
//                            if product.category.rawValue.contains("Boba") {  Text(modelData.convertSizeToString(boxSize: modelData.bobaSize, boxType: bobaType))
//                            }
//                        }
                    }.onDelete(perform: delete)
                }
                hideButton(emptyCart: false)
            }
            .padding(.top)
            .listStyle(PlainListStyle())
            .navigationTitle("Cart")
            .navigationBarItems(trailing:
                Button("Close") {
                    self.presentation.wrappedValue.dismiss()
                    })
        }
    }
    
    func delete(at offset: IndexSet) {
        let openEvents = modelData.products.filter {
            $0.isInCart == false
        }
        modelData.removeEvents(events: offset.map({
            openEvents[$0]
        }))
    }
}
struct hideButton: View {
    var emptyCart: Bool
    var body: some View {
        CheckoutButton().disabled(emptyCart)
    }
}

struct CartDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CartDetailView()
            .environmentObject(ModelData())
    }
}
