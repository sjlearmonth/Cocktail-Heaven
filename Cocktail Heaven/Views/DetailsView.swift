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
            VStack(alignment: .center, spacing: 10.0) {
                HStack(alignment: .center, spacing: 10) {
                    Text(cocktail.strDrink)
                        .navigationTitle("Cocktail by first letter")
                    Text(cocktail.strAlcoholic)
                }
                VStack(alignment: .center, spacing: 10.0) {
                    WebImage(url: URL(string: cocktail.strDrinkThumb))
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                    List {
                        
                    }
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
