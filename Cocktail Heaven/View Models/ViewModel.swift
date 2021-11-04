//
//  ViewModel.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 26/10/2021.
//

import Foundation

class ViewModel {
    
    var dataType: String
    var urlString: String
    var drinks: Drinks = Drinks(drinks: [Cocktail]())
    var ingredients: Ingredients = Ingredients(ingredients: [Ingredient]())
    var alcohols: Alcohols = Alcohols(drinks: [Alcohol]())
    var dataIsFound: Bool = true
    
    init(urlString: String, dataType: String) {
        self.urlString = urlString
        self.dataType = dataType
        FetchData()
    }
    
    func FetchData() {
        switch dataType {
        case "Drinks":
            let networkManager = NetworkManager<Drinks>()
            networkManager.fetchData(urlString) { results, error in
                DispatchQueue.main.async {
                    guard let resultsSafe = results else { return }
                    self.drinks = resultsSafe
                    self.dataIsFound = !error
                }
            }

        case "Ingredients":
            let networkManager = NetworkManager<Ingredients>()
            print(urlString)
            networkManager.fetchData(urlString) { results, error in
                
                DispatchQueue.main.async {
                    guard let resultsSafe = results else { return }
                    self.ingredients = resultsSafe
                    self.dataIsFound = !error
                }
            }
            
        case "Alcohols":
            let networkManager = NetworkManager<Alcohols>()
            networkManager.fetchData(urlString) { results, error in
                DispatchQueue.main.async {
                    guard let resultsSafe = results else { return }
                    self.alcohols = resultsSafe
                    self.dataIsFound = !error
                }
            }

        default:
            break
        }
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
