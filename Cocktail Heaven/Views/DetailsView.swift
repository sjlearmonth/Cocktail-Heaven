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
                    .frame(width: UIScreen.main.bounds.width - 20.0, height: UIScreen.main.bounds.width - 20.0, alignment: .center)
                
                
                Text("~ Ingredients List ~\n").frame(alignment: .center)
                
                ForEach(viewModel.buildIngredients(cocktail), id: \.self) { ingredient in
                    Text(ingredient)
                }
                
                Text("\n~ Recipe Instructions ~\n\n")
                
                Text(cocktail.strInstructions + "\n").fixedSize(horizontal: false, vertical: true)
            }
            
        }
        .foregroundColor(Color.blue)
    }
}




struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: ViewModel(urlString: "www.google.com"))
    }
}

