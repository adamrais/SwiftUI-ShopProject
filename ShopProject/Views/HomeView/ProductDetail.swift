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
    
    @State private var boxType1: ModelData.boxType = .macarons
    @State private var boxType2: ModelData.boxType = .cupcakes
    @State private var bobaType: ModelData.boxType = .boba
    var productIndex: Int {
        modelData.products.firstIndex(where: { $0.id == product.id })!
    }
    
    var body: some View {
        ScrollView {
            Image("BackgroundMacarons")
                .resizable()
                .scaledToFit()
            
            RectangleImage(image: product.image)
                .offset(y:-70)
                .padding(.bottom, -80)
            
            VStack(alignment: .leading) {
                    HStack {
                        Text(product.name)
                            .font(.title)
                            .foregroundColor(.primary)
                        TagView(product: product)
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
                            if product.id == 20 {
                                Label(String(modelData.updatePrice(boxSize: modelData.macaronBoxSize, boxType: boxType1)) , systemImage: "dollarsign.circle")
                                    .font(.title3)
                            } else if product.id == 21 {
                                Label(String(modelData.updatePrice(boxSize: modelData.cupcakeBoxSize, boxType: boxType2)) , systemImage: "dollarsign.circle")
                                    .font(.title3)
                            }
                        } else if product.category.rawValue.contains("Boba") {
                            Label(String(modelData.updatePrice(boxSize: modelData.bobaSize, boxType: bobaType)) , systemImage: "dollarsign.circle")
                                .font(.title3)
                        }
                        else {
                            Label(String(product.price) , systemImage: "dollarsign.circle")
                                .font(.title3)
                        }
                    }
//                    QuantityStepper(product: product)
//                        .font(.title2)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                if product.category.rawValue.contains("Sets") {
                    Divider()
                    VStack {
                        if product.id == 20 {
                            Text("Select how many macarons you want in your box")
                                .multilineTextAlignment(.leading)
                            Spacer()
                            MacaronBoxSizeView(product: product)
                        } else if product.id == 21 {
                            Text("Select how many cupcakes you want in your box")
                                .multilineTextAlignment(.leading)
                            Spacer()
                            CupcakesBoxSizeView(product: product)
                        }
                    }
                } else if product.category.rawValue.contains("Cupcakes") {
                    Divider()
                    VStack {
                        CupcakesExtraView(product: product, setExtra: $modelData.products[productIndex].extraOptions, setFrosting: $modelData.products[productIndex].extraFrosting, setSprinkles: $modelData.products[productIndex].extraSprinkles)
                    }
                } else if product.category.rawValue.contains("Boba") {
                    Divider()
                    VStack {
                        Text("Select the size of your boba")
                            .multilineTextAlignment(.leading)
                        Spacer()
                        BobaExtraView(product: product, setExtra: $modelData.products[productIndex].extraOptions, setSlushy: $modelData.products[productIndex].extraSlushy, setTapioca: $modelData.products[productIndex].extraTapioca)
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
        ProductDetail(product: modelData.products[25])
            .environmentObject(modelData)
    }
}
