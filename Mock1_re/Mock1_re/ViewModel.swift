//
//  ViewModel.swift
//  Mock1_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import Foundation
import SwiftUI

class ViewModel:ObservableObject {
    @AppStorage("selectedCurrency") var selectedCurrency: Currencies = .usd
    let rates = [
        "USD": 308.81,
        "GBP": 390.31,
        "AUD": 204.40,
        "CAD": 232.82,
        "EUR": 334.92
    ]
    @Published var tf1: String = ""
    @Published var tf2: String = ""
    @Published var reverseCalculation: Bool = false
    
    func convert() {
        let rate = rates[selectedCurrency.rawValue]
        let convertedValue = (Double(tf1) ?? 0) * (rate ?? 0)
        tf2 = String(convertedValue)
    }
    
    func reverseConvert() {
        let rate = rates[selectedCurrency.rawValue]
        let convertedValue = (Double(tf2) ?? 0) / (rate ?? 0)
        tf1 = String(convertedValue)
    }
    
    func resetTextFields() {
        tf1 = ""
        tf2 = ""
    }
    
    func resetCurrency() {
        selectedCurrency = .usd
    }
    
}
