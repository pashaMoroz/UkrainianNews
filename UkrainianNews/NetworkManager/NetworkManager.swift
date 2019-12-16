//
//  NetworkManager.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 15.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(with url: String, completion: @escaping (News) -> () ) {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                
                let news = try JSONDecoder().decode(News.self, from: data)
                completion(news)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
