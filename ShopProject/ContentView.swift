//
//  ContentView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CategoryHome()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
