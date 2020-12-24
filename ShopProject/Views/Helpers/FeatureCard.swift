//
//  FeatureCard.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-23.
//

import SwiftUI

struct FeatureCard: View {
    var product: Product
    
    var body: some View {
        product.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(product: product))
    }
}

struct TextOverlay: View {
    var product: Product
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}
struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(product: ModelData().features[0])
    }
}
