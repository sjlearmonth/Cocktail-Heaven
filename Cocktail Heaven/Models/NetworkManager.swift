//
//  NetworkManager.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 20/10/2021.
//

import Foundation

class NetworkManager<DataStruct: Decodable> {
        
    func fetchData(_ urlString: String, completion: @escaping (DataStruct?, Bool) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var drinkData: DataStruct?
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                guard let safeData = data else { return }
                do {
                    drinkData = try decoder.decode(DataStruct.self, from: safeData)
                        completion(drinkData!, false)
                } catch let error {
                    if error.localizedDescription == "The data couldn’t be read because it is missing." {
                        
                        completion(drinkData, true)
                    } else {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
}
