//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 3/7/2024.
//

import Foundation

struct ProductType: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$ " + price.formatPrice()
    }
}
