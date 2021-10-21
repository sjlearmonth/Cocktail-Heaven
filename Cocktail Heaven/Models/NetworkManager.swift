//
//  NetworkManager.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var cocktails = [Cocktail]()
    
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
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func buildIngredients() -> [String] {
        var ingredients:[String] = []
        
        for index in 0..<cocktails.count {
            if let ingredient1 = cocktails[index].strIngredient1 {
                ingredients.append(ingredient1)
            }
            if let ingredient2 = cocktails[index].strIngredient2 {
                ingredients.append(ingredient2)
            }
            if let ingredient3 = cocktails[index].strIngredient3 {
                ingredients.append(ingredient3)
            }
            if let ingredient4 = cocktails[index].strIngredient4 {
                ingredients.append(ingredient4)
            }
            if let ingredient5 = cocktails[index].strIngredient5 {
                ingredients.append(ingredient5)
            }
            if let ingredient6 = cocktails[index].strIngredient6 {
                ingredients.append(ingredient6)
            }
            if let ingredient7 = cocktails[index].strIngredient7 {
                ingredients.append(ingredient7)
            }
            if let ingredient8 = cocktails[index].strIngredient8 {
                ingredients.append(ingredient8)
            }
            if let ingredient9 = cocktails[index].strIngredient9 {
                ingredients.append(ingredient9)
            }
            if let ingredient10 = cocktails[index].strIngredient10 {
                ingredients.append(ingredient10)
            }
            if let ingredient11 = cocktails[index].strIngredient11 {
                ingredients.append(ingredient11)
            }
            if let ingredient12 = cocktails[index].strIngredient12 {
                ingredients.append(ingredient12)
            }

        }
        return ingredients
    }

}
