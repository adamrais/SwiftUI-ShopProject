//
//  CategoryHome.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingFavorites = false
    @State private var showingCart = false

    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .center) {
                    Text("Most Popular item of the week")
                        .font(.headline)
                    PageView(pages: modelData.features.map { FeatureCard(product: $0) })
                        .aspectRatio(3 / 2, contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                }
            
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Small Pastry Shop")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { showingFavorites.toggle() }) {
                        Image(systemName: "heart")
                            .accessibilityLabel("Favorite button")
                    }
                    Button(action: { showingCart.toggle() }) {
                        Image(systemName: "cart")
                            .accessibilityLabel("Cart button")
                    }
                }
            }
            .sheet(isPresented: $showingFavorites) {
                FavoriteList()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
