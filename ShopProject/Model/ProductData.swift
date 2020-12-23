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
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case macarons = "Macarons"
        case boba = "Boba"
        case cupcakes = "Cupcakes"
        //... more items to add after
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
