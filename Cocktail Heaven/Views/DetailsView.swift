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
    
    let searchType: SearchType
    
    var body: some View {
        
        if case .name(let cocktailName) = searchType  {
            
            let viewModel = ViewModel(searchType: .name(cocktailName))
            
            viewModel.FetchCocktailInformation()
            
        } else if case .letter(let firstLetter) = searchType {
            
            let viewModel = ViewModel(searchType: .letter(firstLetter))
            
        } else if case .ingredient(let cocktailIngredient) = searchType {
            
            let viewModel = ViewModel(searchType: .ingredient(cocktailIngredient))
            
        } else if case .alcohol(let isPresent) = searchType {
        
            let viewModel = ViewModel(searchType: .alcohol(isPresent))
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        if viewModel.dataType == "Drinks" {
//
//            List(viewModel.drinks.drinks) { cocktail in
//                VStack(alignment: .center) {
//                    HStack(alignment: .center) {
//                        Text(cocktail.strDrink + "  -")
//                            .frame(alignment: .center)
//                        Text(cocktail.strAlcoholic)
//                            .frame(alignment: .center)
//                    }
//
//                    WebImage(url: URL(string: cocktail.strDrinkThumb))
//                        .resizable()
//                        .frame(alignment: .center)
//                        .aspectRatio(contentMode: .fill)
//
//                    Text("~ Ingredients List ~\n").frame(alignment: .center)
//
//                    ForEach(viewModel.buildIngredients(cocktail), id: \.self) { ingredient in
//                        Text(ingredient)
//                    }
//
//                    Text("\n~ Recipe Instructions ~\n\n")
//
//                    Text(cocktail.strInstructions + "\n").fixedSize(horizontal: false, vertical: true)
//                }
//                .listRowBackground(Color(.systemTeal))
//                .background(Color(.systemTeal))
//            }
//            .foregroundColor(Color.white)
//            .alert(isPresented: $viewModel.dataIsNotFound) {
//                Alert(title: Text("Error"), message: Text("Cannot find any information. Please try again."), dismissButton: .cancel())
//            }
//
//        }
//
//        if viewModel.dataType == "Ingredients" {
//            List(viewModel.drinks.drinks) { cocktail in
//                VStack(alignment: .center) {
//                    HStack(alignment: .center) {
//                        Text(cocktail.strDrink + "  -")
//                            .frame(alignment: .center)
//                        Text(cocktail.strAlcoholic)
//                            .frame(alignment: .center)
//                    }
//
//                    WebImage(url: URL(string: cocktail.strDrinkThumb))
//                        .resizable()
//                        .frame(alignment: .center)
//                        .aspectRatio(contentMode: .fill)
//
//                    Text("~ Ingredients List ~\n").frame(alignment: .center)
//
//                    ForEach(viewModel.buildIngredients(cocktail), id: \.self) { ingredient in
//                        Text(ingredient)
//                    }
//
//                    Text("\n~ Recipe Instructions ~\n\n")
//
//                    Text(cocktail.strInstructions + "\n").fixedSize(horizontal: false, vertical: true)
//                }
//                .listRowBackground(Color(.systemTeal))
//                .background(Color(.systemTeal))
//            }
//            .foregroundColor(Color.white)
//            .alert(isPresented: $viewModel.dataIsNotFound) {
//                Alert(title: Text("Error"), message: Text("Cannot find any information. Please try again."), dismissButton: .cancel())
//            }
//        }
//
//        if viewModel.dataType == "Alcohols" {
//            List(viewModel.alcohols.drinks) { alcohol in
//                VStack {
//                    Text(" ~ \(alcohol.strDrink) ~ \n")
//
//                    WebImage(url: URL(string: alcohol.strDrinkThumb))
//                        .resizable()
//                        .frame(alignment: .center)
//                        .aspectRatio(1.0, contentMode: .fill)
//                }
//                .padding()
//            }
//            .alert(isPresented: $viewModel.dataIsNotFound) {
//                Alert(title: Text("Error"), message: Text("Cannot find any information. Please try again."), dismissButton: .cancel())
//            }
//        }
    }
}




struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: ViewModel(urlString: "www.google.com", dataType: ""))
    }
}

