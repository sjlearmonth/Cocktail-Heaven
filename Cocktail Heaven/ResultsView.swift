//
//  ResultsView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 18/10/2021.
//

import SwiftUI

struct ResultsView: View {
    var body: some View {
        List {
            Text("Cocktail One")
                .foregroundColor(.black)
                .navigationTitle("Search Results")
                .navigationBarTitleDisplayMode(.inline)
                .listRowBackground(Color.white)
            Text("Cocktail Two")
                .foregroundColor(.black)
                .listRowBackground(Color.white)
        }
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
