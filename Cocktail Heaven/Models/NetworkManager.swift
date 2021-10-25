//
//  NetworkManager.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import Foundation
import UIKit
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var cocktails = [Cocktail]()
    @Published var noDataFound = false
    
    func fetchData(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                guard let safeData = data else { return }
                do {
                    let results = try decoder.decode(Drink.self, from: safeData)
                    DispatchQueue.main.async {
                        self.cocktails = results.drinks
                    }
                } catch let error {
                    print(error.localizedDescription)
                    if error.localizedDescription == "The data couldn’t be read because it is missing." {
                        DispatchQueue.main.async {
                            self.noDataFound = true
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.noDataFound = false
                        }
                    }
                }
            }
            print(self.cocktails)
        }
        task.resume()
    }
    
    func buildIngredients(_ cocktail: Cocktail) -> [String] {
        var ingredients:[String] = []
        
        if let ingredient1 = cocktail.strIngredient1 {
            ingredients.append(ingredient1)
        }
        if let ingredient2 = cocktail.strIngredient2 {
            ingredients.append(ingredient2)
        }
        if let ingredient3 = cocktail.strIngredient3 {
            ingredients.append(ingredient3)
        }
        if let ingredient4 = cocktail.strIngredient4 {
            ingredients.append(ingredient4)
        }
        if let ingredient5 = cocktail.strIngredient5 {
            ingredients.append(ingredient5)
        }
        if let ingredient6 = cocktail.strIngredient6 {
            ingredients.append(ingredient6)
        }
        if let ingredient7 = cocktail.strIngredient7 {
            ingredients.append(ingredient7)
        }
        if let ingredient8 = cocktail.strIngredient8 {
            ingredients.append(ingredient8)
        }
        if let ingredient9 = cocktail.strIngredient9 {
            ingredients.append(ingredient9)
        }
        if let ingredient10 = cocktail.strIngredient10 {
            ingredients.append(ingredient10)
        }
        if let ingredient11 = cocktail.strIngredient11 {
            ingredients.append(ingredient11)
        }
        if let ingredient12 = cocktail.strIngredient12 {
            ingredients.append(ingredient12)
        }
        
        return ingredients
    }
    
}
