//
//  RectangleImage.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-21.
//

import SwiftUI

struct RectangleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct RectangleImage_Previews: PreviewProvider {
    static var previews: some View {
        RectangleImage(image: Image("FruityCereal"))
    }
}
