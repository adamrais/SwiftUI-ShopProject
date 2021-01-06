//
//  CupcakesExtraView.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-01-04.
//

import SwiftUI

struct CupcakesExtraView: View {
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    @State private var extraOptions: Bool = false
    @State private var extraFrosting: Bool = false
    @State private var extraSprinkles: Bool = false
    @Binding var setExtra: Bool
    @Binding var setFrosting: Bool
    @Binding var setSprinkles: Bool
    
    var body: some View {
        VStack {
            Toggle(isOn: $setExtra.animation()) {
                Text("Any extra on your cupcake?")
            }
            if setExtra {
                Toggle(isOn: $setFrosting.animation()) {
                    Text("Add extra frosting?")
                }
                
                Toggle(isOn: $setSprinkles.animation()) {
                    Text("Any extra sprinkles?")
                }
            }
        }
    }
}

struct CupcakesExtraView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CupcakesExtraView(product: modelData.products[19], setExtra: .constant(true), setFrosting: .constant(true), setSprinkles: .constant(true))
            .environmentObject(modelData)
    }
}
