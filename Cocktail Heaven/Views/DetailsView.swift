//
//  DetailsView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import UIKit

struct DetailsView: View {
    
    var viewModel: ViewModel
    
    var body: some View {
                        
        if viewModel.dataType == "Drinks" {
            
        List(viewModel.drinks.drinks) { cocktail in
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text(cocktail.strDrink + "  -")
                        .frame(alignment: .center)
                    Text(cocktail.strAlcoholic)
                        .frame(alignment: .center)
                }
                
                WebImage(url: URL(string: cocktail.strDrinkThumb))
                    .resizable()
                    .frame(alignment: .center)
                    .aspectRatio(contentMode: .fill)
                
                Text("~ Ingredients List ~\n").frame(alignment: .center)
                
                ForEach(viewModel.buildIngredients(cocktail), id: \.self) { ingredient in
                    Text(ingredient)
                }
                
                Text("\n~ Recipe Instructions ~\n\n")
                
                Text(cocktail.strInstructions + "\n").fixedSize(horizontal: false, vertical: true)
            }
            .listRowBackground(Color(.systemTeal))
            .background(Color(.systemTeal))
        }
        .foregroundColor(Color.white)
        }
        if viewModel.dataType == "Ingredients" {
            
            List(viewModel.ingredients.ingredients) { ingredient in
                VStack {
                    Text("Ingredient: \(ingredient.strIngredient)")
                    if ingredient.strAlcohol == "Yes" {
                        Text("Contains alcohol at \(ingredient.strABV ?? "0")% proof")
                    } else {
                        Text("Contains no alcohol")
                    }
                    Text("~ Description ~\n")
                    Text(ingredient.strDescription).fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        
        if viewModel.dataType == "Alcohols" {
            List(viewModel.alcohols.drinks) { alcohol in
                VStack {
                    Text(" ~ \(alcohol.strDrink) ~ \n")

                    WebImage(url: URL(string: alcohol.strDrinkThumb))
                        .resizable()
                        .frame(alignment: .center)
                        .aspectRatio(1.0, contentMode: .fill)
                }
                .padding()
            }
        }
    }
}




struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: ViewModel(urlString: "www.google.com", dataType: ""))
    }
}

