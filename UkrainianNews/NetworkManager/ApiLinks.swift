//
//  ApiLinks.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 15.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import Foundation

enum ApiLinks: String {
    
    enum Kay: String {
        case kay = "cea019f4d4874c2a83549b5c1477bcb9"
    }
    
    case business = "https://newsapi.org/v2/top-headlines?country=ua&category=business&apiKey="
    case entertainment = "https://newsapi.org/v2/top-headlines?country=ua&category=entertainment&apiKey="
    case health = "https://newsapi.org/v2/top-headlines?country=ua&category=health&apiKey="
    case science = "https://newsapi.org/v2/top-headlines?country=ua&category=science&apiKey="
    case sports = "https://newsapi.org/v2/top-headlines?country=ua&category=sports&apiKey="
    case technology = "https://newsapi.org/v2/top-headlines?country=ua&category=technology&apiKey="
    
    func getApiLinks() -> String { return self.rawValue + ApiLinks.Kay.kay.rawValue  }
}

