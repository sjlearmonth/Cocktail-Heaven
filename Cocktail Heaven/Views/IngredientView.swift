//
//  IngredientView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 03/11/2021.
//

import SwiftUI

struct IngredientView: View {
    
    @State var enteredIngredient: String = " "
    @State var ingredientIsEntered: Bool = false
    
    var body: some View {
        
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 5.0) {
                Text("Please enter the ingredient you want to search for.")
                    .padding(50.0)
                    .foregroundColor(.white)
                    .font(.system(size: 20.0))
                    .navigationTitle("Search by Ingredient")
                
                TextField("Ingredient", text: $enteredIngredient)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250.0, height: 60.0, alignment: .center)
                    .padding()
                    .foregroundColor(.black)
                NavigationLink(isActive: $ingredientIsEntered) {
                    DetailsView(viewModel: ViewModel(urlString: "https://www.thecocktaildb.com/api/json/v1/1/search.php?i=vodka"))
                    
                } label: {
                    EmptyView()
                }
                
                Button {
                    if !enteredIngredient.isEmpty {
                        ingredientIsEntered = true
                    }
                    
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.system(size: 25.0))
                        .padding()
                        .frame(width: 250.0)
                }
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                
            }
        }
    }
}




struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
