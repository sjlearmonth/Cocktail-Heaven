//
//  ApiData.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import Foundation

struct Drinks: Decodable {
    var drinks: [Cocktail]
}

struct Cocktail: Decodable, Identifiable {
    var id: String {
        return idDrink
    }
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
    let strAlcoholic: String
    let strGlass: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
}

struct Ingredients: Decodable {
    var ingredients: [Ingredient]
}

struct Ingredient: Decodable, Identifiable {
    var id: String {
        return idIngredient
    }
    let idIngredient: String
    let strIngredient: String
    let strAlcohol: String
    let strDescription: String
    let strABV: String
    let strType: String
}
