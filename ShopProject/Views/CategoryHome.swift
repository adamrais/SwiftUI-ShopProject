//
//  CategoryHome.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .center) {
                    modelData.features[0].image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                    Text("Our most popular item is the " + modelData.features[0].name)
                        .font(.headline)
                }
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .navigationTitle("Small Pastry Shop")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
