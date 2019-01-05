//
//  APIManager.swift
//  ManishPractical
//
//  Created by Syon on 03/01/19.
//  Copyright © 2019 Syon. All rights reserved.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    // MARK: GET API
    func getMoviesAPI(urlString: String, completion: @escaping ([Search]) -> ()) {
  
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed",err)
                    return
                }
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(Movies.self, from: data)
                    completion(result.Search)
                } catch let jsonErr {
                    print("Failed to decode", jsonErr)
                }
            }
            }.resume()
    }
    
}
