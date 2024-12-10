//
//  HomeView.swift
//  Mock1_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Currency Converter")
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        TextField("", text: $viewModel.tf1)
                            .textFieldStyle(.roundedBorder)
                            .onChange(of: viewModel.tf1) { newValue in
                                if(!viewModel.reverseCalculation){
                                    viewModel.convert()
                                }
                            }
                            .disabled(viewModel.reverseCalculation)
                        Picker(selection: $viewModel.selectedCurrency) {
                            ForEach(Currencies.allCases, id:\.self) { currency in
                                Text(currency.rawValue)
                            }
                        } label: {
                        }.pickerStyle(.menu)
                    }
                    HStack {
                        TextField("", text: $viewModel.tf2)
                            .textFieldStyle(.roundedBorder)
                            .onChange(of: viewModel.tf2) { newValue in
                                if(viewModel.reverseCalculation){
                                    viewModel.reverseConvert()
                                }
                            }
                            .disabled(!viewModel.reverseCalculation)
                        Text("LKR")
                    }
                    HStack {
                        Text("Switch calculation")
                        Spacer()
                        Toggle("", isOn: $viewModel.reverseCalculation)
                    }
                }

                Spacer()
                Button("Reset TextFields") {
                    viewModel.resetTextFields()
                }
                    .buttonStyle(.bordered)
                    .tint(.red)
            }
            .padding()
        }
    }
    
    
}

//#Preview {
//    HomeView()
//}
