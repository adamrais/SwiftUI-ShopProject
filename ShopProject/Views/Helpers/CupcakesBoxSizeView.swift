//
//  CupcakesBoxSizeView.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-01-04.
//

import SwiftUI

struct CupcakesBoxSizeView: View {
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    var body: some View {
                VStack {
                    Picker("Select how many cupcakes you want in your box", selection: $modelData.cupcakeBoxSize) {
                        ForEach(0..<ModelData.cupcakeBoxSizes.count, id: \.self) {
                            Text(ModelData.cupcakeBoxSizes[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
    }
}

struct CupcakesBoxSizeView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CupcakesBoxSizeView(product: modelData.products[13])
            .environmentObject(modelData)
    }
}
