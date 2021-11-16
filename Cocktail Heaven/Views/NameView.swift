//
//  NameView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 25/10/2021.
//

import SwiftUI

struct NameView: View {
    
    @State var enteredName: String = ""
    @State var nameIsEntered: Bool = false
    
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 5.0) {
                Text("Please enter the name of the\ncocktail you want to search for.")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 20.0))
                    .navigationTitle("Search by cocktail name")
                
                TextField("Cocktail name", text: $enteredName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250.0, height: 60.0, alignment: .center)
                    .padding()
                    .foregroundColor(.black)
                NavigationLink(isActive: $nameIsEntered) {
                    if nameIsEntered {
                        DetailsView(viewModel: ViewModel(urlString: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(enteredName)", dataType: "Drinks"))
                    }
                } label: {
                    EmptyView()
                }
                
                Button {
                    if !enteredName.isEmpty {
                        nameIsEntered = true
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

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
