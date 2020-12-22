//
//  ContentView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-20.
//

import SwiftUI

struct ContentView: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(image: Image("FruityCereal"))
    }
}
