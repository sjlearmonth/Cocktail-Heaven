//
//  ContentView.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 15/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemTeal)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to Cocktail Heaven!")
                        .fontWeight(.regular)
                        .font(.system(size: 25.0))
                        .foregroundColor(.white)
                        .navigationBarHidden(true)
                    Image("cocktailImage")
                        .resizable()
                        .frame(width: 300.0, height: 300.0, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    Spacer()
                    NavigationLink {
                    SelectView()
                    } label: {
                        Text("Press to continue")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    
                }
            }
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
