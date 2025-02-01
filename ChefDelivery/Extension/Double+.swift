//
//  Double+.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 4/7/2024.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
