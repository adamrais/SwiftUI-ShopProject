//
//  BobaExtraView.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-01-13.
//

import SwiftUI

struct BobaExtraView: View {
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    @Binding var setExtra: Bool
    @Binding var setSlushy: Bool
    @Binding var setTapioca: Bool
    
    var body: some View {
        VStack {
            Picker("Select the size of your boba", selection: $modelData.bobaSize) {
                ForEach(0..<ModelData.bobaSizes.count, id: \.self) {
                    Text(ModelData.bobaSizes[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Divider()
            
            Toggle(isOn: $setExtra.animation()) {
                Text("Any extra on your cupcake?")
            }
            if setExtra {
                Toggle(isOn: $setSlushy.animation()) {
                    Text("Add extra slush? (0.75$)")
                }
                
                Toggle(isOn: $setTapioca.animation()) {
                    Text("Add extra tapioca? (0.50$)")
                }
            }
        }
    }
}

struct BobaExtraView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        BobaExtraView(product: modelData.products[19], setExtra: .constant(true), setSlushy: .constant(true), setTapioca: .constant(true) )
        .environmentObject(modelData)
    }
}
