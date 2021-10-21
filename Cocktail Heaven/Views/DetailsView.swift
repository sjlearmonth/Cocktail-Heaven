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
    
    lazy var ingredients = networkManager.buildIngredients()
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
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text("Ingredients List").frame(alignment: .center)
                ForEach(ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
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
