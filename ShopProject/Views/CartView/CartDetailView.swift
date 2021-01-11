//
//  CartDetailView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-29.
//

import SwiftUI

struct CartDetailView: View {
    @State private var showCartItemsOnly = true
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
                List {
                    ForEach(itemInCart) { product in
                            ProductRow(product: product)
                        if product.extraOptions {
                            Text(String(product.extraFrosting))
                        }
                    }.onDelete(perform: delete)
                }
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

struct CartDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CartDetailView()
            .environmentObject(ModelData())
    }
}
