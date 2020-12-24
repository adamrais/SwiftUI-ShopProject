//
//  CategoryItem.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-22.
//

import SwiftUI

struct CategoryItem: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            product.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            HStack(alignment: .center) {
                Text(product.name)
                    .foregroundColor(.primary)
                    .font(.caption) // might need to make this bigger
                
                Spacer()
                
                if product.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
            }
            
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(product: ModelData().products[0])
    }
}
