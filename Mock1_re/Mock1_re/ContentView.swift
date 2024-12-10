//
//  ContentView.swift
//  Mock1_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            SettingsView(viewModel: viewModel)
                .tabItem{
                    Label("Settings", systemImage: "gearshape")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
