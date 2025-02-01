//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 3/7/2024.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
}
