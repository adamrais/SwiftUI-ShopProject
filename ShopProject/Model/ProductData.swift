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
    var quantity: Int {
        didSet {
            quantity = 0 // might delete
        }
    }
    
    // MARKS: cupcakes extra
    var extraOptions: Bool
    {
        didSet {
            if extraOptions == false {
                extraFrosting = false
                extraSprinkles = false
                extraSlushy = false
                extraTapioca = false
            }
        }
    }
    var extraFrosting: Bool
    var extraSprinkles: Bool
    
    // MARKS: bobas extra
    var tag: String?
    var extraSlushy: Bool
    var extraTapioca: Bool
    enum Tags {
        case milk
        case fruit
    }
    
    func getTotalOrderPrice(item: Double) -> Double {
        var total = 0.0
        total += item
        total += getExtraOrderPrice()
        return total
    }
    func getExtraOrderPrice() -> Double {
        if extraFrosting == true || extraSprinkles == true {
            if extraFrosting == true && extraSprinkles == true {
                return 1
            } else {
                if extraFrosting == true {
                    return 0.50
                } else if extraSprinkles == true {
                    return 0.50
                }
            }
        } else if extraSlushy == true || extraTapioca == true {
            if extraSlushy == true && extraTapioca == true {
                return 1.25
            } else {
                if extraSlushy == true {
                    return 0.75
                } else if extraTapioca == true {
                    return 0.50
                }
            }
        }
        return 0
    }
    
    func getExtraOrderString() -> String {
        if extraFrosting == true || extraSprinkles == true {
            if extraFrosting == true && extraSprinkles == true {
                return "extra frosting/extra sprinkles"
            } else {
                if extraFrosting == true {
                    return "extra frosting"
                } else if extraSprinkles == true {
                    return "extra sprinkles"
                }
            }
        } else if extraSlushy == true || extraTapioca == true {
            if extraSlushy == true && extraTapioca == true {
                return "extra slushy/extra tapioca"
            } else {
                if extraSlushy == true {
                    return "extra slushy"
                } else if extraTapioca == true {
                    return "extra tapioca"
                }
            }
        }
        return "no extra"
    }
    
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
