//
//  ContentView.swift
//  ShopProject
//
//  Created by Adam Rais on 2020-12-20.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case search
        case about
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            
            SettingsView()
                .tabItem {
                    Label("About", systemImage: "gearshape")
                }
                .tag(Tab.about)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
