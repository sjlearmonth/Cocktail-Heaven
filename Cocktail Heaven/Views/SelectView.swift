//
//  SelectView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 18/10/2021.
//

import SwiftUI

struct SelectView: View {
    @State var resultsIsSelected = false
    @State var firstLetterIsSelected = false
    @State var nameIsSelected = false
    @State var ingredientIsSelected = false
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                
                NavigationLink(isActive: $firstLetterIsSelected) {
                    LettersView()
                } label: {
                    Button {
                        firstLetterIsSelected = true
                    } label: {
                        Text("Search by first letter")
                            .foregroundColor(.white)
                            .font(.system(size: 25.0))
                            .padding()
                            .navigationTitle("Select Search Option")
                            .navigationBarTitleDisplayMode(.inline)
                            .frame(width: UIScreen.main.bounds.width - 20.0)
                    }
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 30.0))
                }
                
                NavigationLink(isActive: $nameIsSelected) {
                    NameView()
                } label: {
                    Button {
                        nameIsSelected = true
                    } label: {
                        Text("Search by cocktail name")
                            .foregroundColor(.white)
                            .font(.system(size: 25.0))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 20.0)
                    }
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 30.0))
                }
                
                NavigationLink(isActive: $ingredientIsSelected) {
                    IngredientView()
                } label: {
                    Button {
                        ingredientIsSelected = true
                    } label: {
                        Text("Search by ingredient")
                            .foregroundColor(.white)
                            .font(.system(size: 25.0))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 20.0)
                    }
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 30.0))
                }
                
                NavigationLink(isActive: $resultsIsSelected) {
                    ResultsView()
                } label: {
                    Button {
                        resultsIsSelected = true
                    } label: {
                        Text("Search by alcohol content")
                            .foregroundColor(.white)
                            .font(.system(size: 25.0))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 20.0)
                    }
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 30.0))
                }
            }
        }
    }
}









struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
