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
                
                HStack {
                    Text("Price") // change for category after
                        .font(.title3)
                        .bold()
                    Spacer()
                    Label(String(product.price) , systemImage: "dollarsign.circle")
                        .font(.title3)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About this product")
                    .font(.title2)
                Text(product.description)
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
