//
//  ModelData.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var products: [Product] = load("shopData.json")
    
    static let macaronBoxSizes = ["6","12","24"]
    static let cupcakeBoxSizes = ["6","12","18"]
    @Published var macaronBoxSize = 0
    @Published var cupcakeBoxSize = 0
    @Published var quantity = 0
    @Published var notificatonCart = 0
    
    var features: [Product] {
        products.filter { $0.isFeatured }
    }
    var inCart: [Product] {
        products.filter { $0.isInCart }
    }

    var extraFrosting: [Product] {
        products.filter { $0.extraFrosting }
    }
    var extraSprinkles: [Product] {
        products.filter { $0.extraSprinkles }
    }
    
    var categories: [String: [Product]] {
        Dictionary(
            grouping: products,
            by: { $0.category.rawValue }
        )
    }
    
    enum boxType {
        case macarons
        case cupcakes
    }
    
    func removeEvents(events: [Product]) {
        products.removeAll(where: {
            events.contains($0)
        })
    }
    
    func updatePrice(boxSize: Int, boxType: boxType) -> Int {
        if boxType == .macarons {
            if boxSize == 0 {
               return 8
           } else if boxSize == 1 {
               return 14
           } else if boxSize == 2 {
               return 26
           }
        } else if boxType == .cupcakes {
            if boxSize == 0 {
               return 10
           } else if boxSize == 1 {
               return 16
           } else if boxSize == 2 {
               return 28
           }
        }
        
       return 0 // default value
   }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
