//
//  ViewModel.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 26/10/2021.
//

import Foundation
import UIKit

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
            let networkManager = NetworkManager<Drinks>()
            let letters = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
            let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f="
            
            // Extract ingredient from the URL
            var ingredient = urlString.drop { character in
                return character != "="
            }
            ingredient.removeFirst()
            print("DEBUG: \(ingredient)")
            
            //             Search cocktails for those with the named ingredient
            if !ingredient.isEmpty {
                var callCount = 0
                
                // Use for-in loop to fetch all the cocktails by first letter
                self.drinks = Drinks(drinks: [Cocktail]())
                for letter in letters {
                    let url = baseUrl + letter
                    networkManager.fetchData(String(url)) { results, error in
                        DispatchQueue.main.async {
                            guard let resultsSafe = results else { callCount += 1;
                                                                   self.dataIsFound = self.dataIsFound && error;
                                                                   return }
                            self.drinks.drinks.append(contentsOf: resultsSafe.drinks)
                            callCount += 1
                            self.dataIsFound = self.dataIsFound && error
                            if callCount == 26 {
                                
                                // Return filtered cocktails
                                let cocktails = self.drinks.drinks.filter { cocktail in
                                    let ingredientIsPresent =
                                    cocktail.strIngredient1?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient2?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient3?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient4?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient5?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient6?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient7?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient8?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient9?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient10?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient11?.contains(ingredient) ?? false ||
                                    cocktail.strIngredient12?.contains(ingredient) ?? false
                                    print("DEBUG: \(ingredient); \(ingredientIsPresent)")
                                    return ingredientIsPresent
                                }
                                if cocktails.count > 0 {
                                    self.drinks.drinks = cocktails
                                }
                            }
                        }
                    }
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

