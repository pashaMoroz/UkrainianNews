//
//  NetworkManager.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 15.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()

     func fetchData(with url: String, completion: @escaping (News) -> ()) {

        request(url).responseData { (dataResponse) in
            switch dataResponse.result {

            case .success(let data):
                guard let article = try? JSONDecoder().decode(News.self, from: data) else {
                    return
                }
                completion(article)
            case .failure(let error):
                print(error)
            }
        }
    }

     func fetchDataImage(url: String, completion: @escaping (UIImage) -> ()) {

        request(url).responseData { (dataResponse) in
            switch dataResponse.result {

            case .success(let data):
                guard let image = UIImage(data: data) else {

                    return
                }
                completion(image)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
