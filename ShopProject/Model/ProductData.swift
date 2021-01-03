//
//  ShopData.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-21.
//

import Foundation
import SwiftUI

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var price: Int
    var description: String
    var isFeatured: Bool
    var isFavorite: Bool
    var isInCart: Bool
    var quantity: Int
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case macarons = "Macarons"
        case boba = "Boba"
        case cupcakes = "Cupcakes"
        case sets = "Sets"
        //... more items to add after
    }
    enum ActiveAlert {
        case first
        case second
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}
