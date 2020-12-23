//
//  ShopProjectApp.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-20.
//

import SwiftUI

@main
struct ShopProjectApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
