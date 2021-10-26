//
//  NetworkManager.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import Foundation

class NetworkManager {
        
    func fetchData(_ urlString: String, completion: @escaping (Drinks, Bool) -> Void) {
        guard let url = URL(string: urlString) else { return }
        print(urlString)
        var drinks: Drinks?
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                guard let safeData = data else { return }
                do {
                    drinks = try decoder.decode(Drinks.self, from: safeData)
                        completion(drinks!, false)
                } catch let error {
                    print(error.localizedDescription)
                    if error.localizedDescription == "The data couldn’t be read because it is missing." {
                            completion(drinks ?? Drinks(cocktails: [Cocktail]()), true)
                    } else {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
}
