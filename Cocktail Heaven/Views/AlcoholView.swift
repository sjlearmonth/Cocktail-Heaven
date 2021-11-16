//
//  AlcoholView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 04/11/2021.
//

import SwiftUI

struct AlcoholView: View {
    
    @State var isAlcoholic: Bool = false
    @State var alcoholicIsSelected: Bool = false
    @State var nonAlcoholicIsSelected: Bool = false
    
    var body: some View {
        
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Please select search by alcoholic\nor non-alcoholic cocktail")
                    .foregroundColor(.white)
                    .font(.system(size: 20.0))
                    .navigationTitle("Search by Alcohol Content")
                
                Toggle(isOn: $isAlcoholic) {
                    Text("Alcoholic:").foregroundColor(.white).font(.system(size: 20.0))
                }
                .padding(EdgeInsets(top: 20.0, leading: 80.0, bottom: 20.0, trailing: 80.0))
                
                NavigationLink(isActive: $alcoholicIsSelected) {
                    if alcoholicIsSelected {
                        DetailsView(viewModel: ViewModel(urlString: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic", dataType: "Alcohols"))
                    }
                } label: {
                    EmptyView()
                }
                
                NavigationLink(isActive: $nonAlcoholicIsSelected) {
                    if nonAlcoholicIsSelected {
                        DetailsView(viewModel: ViewModel(urlString: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic", dataType: "Alcohols"))
                    }
                } label: {
                    EmptyView()
                }
                
                
                Button {
                    if isAlcoholic {
                        alcoholicIsSelected = true
                        nonAlcoholicIsSelected = false
                    } else {
                        alcoholicIsSelected = false
                        nonAlcoholicIsSelected = true
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

struct AlcoholView_Previews: PreviewProvider {
    static var previews: some View {
        AlcoholView()
    }
}
