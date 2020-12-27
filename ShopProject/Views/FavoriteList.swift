//
//  FavoriteList.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-23.
//

import SwiftUI

struct FavoriteList: View {
    @State private var showFavoritesOnly = true
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentation
    
    var favoriteProduct: [Product] {
        modelData.products.filter { product in
            (!showFavoritesOnly || product.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favoriteProduct) { product in
                    NavigationLink(destination: ProductDetail(product: product)) {
                        ProductRow(product: product)
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarItems(trailing:
                Button("Close") {
                    self.presentation.wrappedValue.dismiss()
                    })
        }
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
            .environmentObject(ModelData())
    }
}
