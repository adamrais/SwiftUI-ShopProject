//
//  CheckoutButton.swift
//  ShopProject
//
//  Created by Adam Rais on 2021-02-01.
//

import SwiftUI

struct CheckoutButton: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isCheckout = false
    @State private var showAlert = false
    @State private var clearCart = true
    var body: some View {
        VStack {
            Button(action: {
                //goes to summary page to show final price order
                isCheckout = true
                showAlert = true
            }) {
                labelCheckout(text: "Checkout", color: .white)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Order sent"), message: Text("Thank you for your order"), dismissButton: .default(Text("Okay")))
            }
            
            NavigationLink(destination: CheckoutView(), isActive: $isCheckout) {
                // add code later
            }//.navigationBarHidden(true)
        }

    }
}

struct labelCheckout: View {
    var text: String
    var color: Color
    var body: some View {
        Label(
            title: { Text(text)
                .fontWeight(.semibold)
                .font(.title3)
            },
            icon: { Image(systemName: "bag")
                .font(.title3)
            }
            )
            .padding()
            .foregroundColor(color)
            .background(Color.black)
            .cornerRadius(40)
    }
}

struct CheckoutButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutButton()
    }
}
