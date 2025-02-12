//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 9/2/2025.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-a0bdaf-chefdelivery24.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let stores = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(stores)
    }
    
    func confirmOrder(product: ProductType) async throws -> Result<[String:Any]?, RequestError> {
        guard let url = URL(string: "https://private-a0bdaf-chefdelivery24.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String:Any]
        
        return .success(message)
    }
}
