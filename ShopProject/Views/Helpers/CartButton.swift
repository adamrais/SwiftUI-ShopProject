//
//  CartButton.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-26.
//

import SwiftUI

struct CartButton: View {
    @State var labelNumber = 0
    var body: some View {
        if labelNumber != 0 {
            Image(systemName: "cart")
                .overlay(NotificationBadge(number: $labelNumber).position(x: 40, y: 10))
                .font(.title3)
        } else {
            Image(systemName: "cart")
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
    }
}
