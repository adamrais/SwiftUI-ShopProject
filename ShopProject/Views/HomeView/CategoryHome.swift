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
    @State private var notificationNumber = 0

    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .center) {
                    Text("Most Popular items of the week")
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
                    .sheet(isPresented: $showingFavorites) {
                        FavoriteList()
                            .environmentObject(modelData)
                    }
                    Button(action: { showingCart.toggle() }) {
                        CartButton(labelNumber: modelData.notificatonCart)
                    }
                    .sheet(isPresented: $showingCart) {
                        CartDetailView()
                            .environmentObject(modelData)
                    }
                }
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
