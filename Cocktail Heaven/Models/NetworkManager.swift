//
//  NetworkManager.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var cocktails = [Cocktail]()
    
    func fetchData(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                guard let safeData = data else { return }
                do {
                    let results = try decoder.decode(Drinks.self, from: safeData)
                    DispatchQueue.main.async {
                        self.cocktails = results.drinks
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }

}
