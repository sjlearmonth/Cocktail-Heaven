//
//  NameView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 25/10/2021.
//

import SwiftUI

struct NameView: View {
    @State var enteredText: String = ""
    @State var nameIsEntered: Bool = false
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Please enter the name of the\ncocktail you want to search for.")
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
            TextField("Cocktail name", text: $enteredText)
                .textFieldStyle(.roundedBorder)
                .frame(width: 250.0, height: 60.0, alignment: .center)
            NavigationLink(isActive: $nameIsEntered) {
                DetailsView(urlString: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(enteredText)")
            } label: {
                EmptyView()
            }

            Button {
                nameIsEntered = true
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

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
