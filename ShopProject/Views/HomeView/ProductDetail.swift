//
//  ProductDetail.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-22.
//

import SwiftUI

struct ProductDetail: View {
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    @State var quantity: Int = 0
    var productIndex: Int {
        modelData.products.firstIndex(where: { $0.id == product.id })!
    }
    
    var body: some View {
        ScrollView {
            Image("BackgroundMacarons")
                .resizable()
                .scaledToFit()
                //.frame(height: 300)
            
            RectangleImage(image: product.image)
                .offset(y:-70)
                .padding(.bottom, -80)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(product.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    Spacer()
                    FavoriteButton(isSet: $modelData.products[productIndex].isFavorite)
                        .font(.title2)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Price") // change for category after
                            .font(.title3)
                            .bold()
                        Spacer()
                        
                        if product.category.rawValue.contains("Sets") {
                            Label(String(modelData.updatePrice(boxSize: modelData.macaronBoxSize)) , systemImage: "dollarsign.circle")
                                .font(.title3)
                        } else {
                            Label(String(product.price) , systemImage: "dollarsign.circle")
                                .font(.title3)
                        }
                    }
                    
                    HStack {
                        Text("Quantity")
                            .font(.title3)
                            .bold()
                        Stepper(value: $modelData.quantity, in: 0...20) {
                            Text("\(modelData.quantity)")
                                .font(.title2)
                        }//.onDisappear(perform: {
                          //  modelData.quantity = 0
                        //})
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                if product.category.rawValue.contains("Sets") {
                    Divider()
                    VStack {
                        Text("Select how many macarons you want in your box")
                            .multilineTextAlignment(.leading)
                        Spacer()
                        MacaronBoxSizeView(product: product)
                    }
                }
                
                Divider()
                
                Text("About this product")
                    .font(.title2)
                Text(product.description)
                
                Spacer()
                
                addToCartButton(product: product, isSet: $modelData.products[productIndex].isInCart)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 120)
            }
            .padding()
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ProductDetail(product: modelData.products[0])
            .environmentObject(modelData)
    }
}
