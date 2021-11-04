//
//  LetterListView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import SwiftUI

struct LettersView: View {
    
    var letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0)}
    
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            
            List(letters, id: \.self) { letter in
                
                NavigationLink(destination: DetailsView(viewModel: ViewModel(urlString: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=\(letter)", dataType: "Drinks"))) {
                    
                    Text("\(letter)").fontWeight(.bold)
                    
                }
            }
        }
    }
}


struct LetterListView_Previews: PreviewProvider {
    static var previews: some View {
        LettersView()
    }
}



