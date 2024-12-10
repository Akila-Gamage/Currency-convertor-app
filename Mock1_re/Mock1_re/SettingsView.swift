//
//  SettingsView.swift
//  Mock1_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Text("Settings")
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Currency")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Picker(selection: $viewModel.selectedCurrency) {
                    ForEach(Currencies.allCases, id:\.self) { currency in
                        Text(currency.rawValue)
                    }
                } label: {
                }.pickerStyle(.wheel)
                Spacer()
                Button("Reset TextFields") {
                    viewModel.resetCurrency()
                }
                    .buttonStyle(.bordered)
                    .tint(.red)
                
            }.padding()
        }
    }

}

//#Preview {
//    SettingsView()
//}
