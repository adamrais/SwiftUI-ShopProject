//
//  MacaronBoxSizeView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-28.
//

import SwiftUI

struct MacaronBoxSizeView: View {
    @EnvironmentObject var modelData: ModelData
    var product: Product
    
    var body: some View {
                VStack {
                    Picker("Select how many macarons you want in your box", selection: $modelData.macaronBoxSize) {
                        ForEach(0..<ModelData.macaronBoxSizes.count, id: \.self) {
                            Text(ModelData.macaronBoxSizes[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
    }
}

struct MacaronBoxSizeVIew_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MacaronBoxSizeView(product: modelData.products[13])
            .environmentObject(modelData)
    }
}
