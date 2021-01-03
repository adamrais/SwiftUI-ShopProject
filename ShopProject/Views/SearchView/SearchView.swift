//
//  SearchView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-26.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.top, 0)
                List {
                    ForEach(modelData.products.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { product in
                        NavigationLink(destination: ProductDetail(product: product)) {
                            ProductRow(product: product)
                        }
                    }
                }
            }
            .navigationTitle("All Items")
            .listStyle(PlainListStyle())
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ModelData())
    }
}
