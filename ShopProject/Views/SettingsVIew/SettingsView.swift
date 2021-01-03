//
//  AboutPageView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Notifications")
                    Text("Autorisations")
                }
                Section {
                    HStack {
                        Text("Feedback")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    HStack {
                        Text("Please Rate This App")
                        Spacer()
                        Image(systemName: "star")
                    }
                }
                Section {
                    Text("About us")
                    Text("Copyright Info")
                    Text("Privacy Policy")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
