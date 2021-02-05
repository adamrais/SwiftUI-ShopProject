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
    @State private var subtotal: Double = 0
    @State private var deliveryFees = 3.99
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
                        CartDetailRow(subtotal: $subtotal, product: product)
                        
                    }.onDelete(perform: delete)
                }
                if itemInCart.count == 0 {
                    Text("No item in cart")
                        .offset(y: -300)
                        .font(.system(.title, design: .rounded))
                    hideButton(emptyCart: true)
                } else {
                    Divider()
                    HStack {
                        Text("Articles(\(String(itemInCart.count))): ")
                            .offset(x: -100)
                        Text("\(modelData.getSubtotal(total: Double(subtotal)), specifier: "%.2f") CDN$")
                            .offset(x: 100)
                    }
                    HStack {
                        Text("Delivery fees: ")
                            .offset(x: -91)
                        Text("3.99 CDN$")
                            .offset(x: 90)
                    }
                    HStack {
                        Text("Subtotal: ")
                            .offset(x: -107)
                        Text("\(getDeliveryFees(), specifier: "%.2f") CDN$")
                            .offset(x: 105)
                    }
                    HStack {
                        Text("Taxes: ")
                            .offset(x: -118)
                        Text("\(getTaxes(), specifier: "%.2f") CDN$")
                            .offset(x: 115)
                    }
                    HStack {
                        Text("Total: ")
                            .fontWeight(.bold)
                            .offset(x: -115)
                        Text("\(getTotalOrder(), specifier: "%.2f") CDN$")
                            .fontWeight(.bold)
                            .offset(x: 115)
                    }
                    Divider()
                    
                    
                    hideButton(emptyCart: false).onTapGesture {
                        modelData.emptyCart()
                    }
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
    func getDeliveryFees() -> Double {
        var deliveryFees = 3.99
        for _ in itemInCart {
            deliveryFees += subtotal
        }
        return deliveryFees
    }
    func getTaxes() -> Double {
        let taxes = 0.15
        var totalTaxes = 0.0
        totalTaxes += (getDeliveryFees() * taxes)
        
        return totalTaxes
    }
    func getTotalOrder() -> Double {
        var TotalOrder = 0.0
        TotalOrder += (getDeliveryFees() + getTaxes())
        
        return TotalOrder
    }
}
struct hideButton: View {
    var emptyCart: Bool
    var body: some View {
        if emptyCart == true {
            CheckoutButton().hidden()
        } else {
            CheckoutButton()
        }
    }
}

struct CartDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CartDetailView()
            .environmentObject(ModelData())
    }
}
