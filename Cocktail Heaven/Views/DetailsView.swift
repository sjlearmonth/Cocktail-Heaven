//
//  DetailsView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    let urlString: String
    
    var body: some View {
        
        List(networkManager.cocktails) { cocktail in

            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text(cocktail.strDrink + "  -")
                        .navigationTitle("Cocktail by first letter")
                        .frame(alignment: .center)
                    Text(cocktail.strAlcoholic)
                        .frame(alignment: .center)
                }
                
                WebImage(url: URL(string: cocktail.strDrinkThumb))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 20.0, height: UIScreen.main.bounds.width - 20.0, alignment: .center)
                    
                
                Text("~ Ingredients List ~\n").frame(alignment: .center)
                
                ForEach(networkManager.buildIngredients(cocktail), id: \.self) { ingredient in
                    Text(ingredient)
                }
                
                Text("\n~ Recipe Instructions ~\n\n")
                
                Text(cocktail.strInstructions + "\n").fixedSize(horizontal: false, vertical: true)
            }
        }
        
        .onAppear {
            self.networkManager.fetchData(urlString)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(urlString: "www.google.com")
    }
}

