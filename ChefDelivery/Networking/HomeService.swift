//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Mariana Alvarez de Carvalho on 9/2/2025.
//

import Foundation

struct HomeService {
    
    func fetchData() {
        guard let url = URL(string: "https://private-a0bdaf-chefdelivery24.apiary-mock.com/home") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let storesObject = try? JSONDecoder().decode([StoreType].self, from: data)
                print(storesObject)
            }
        }.resume()
    }
}
