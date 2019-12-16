//
//  NewsModel.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 15.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import Foundation

struct News: Decodable {
    
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

struct Article: Decodable {
    
    var source: Sources?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Sources: Decodable {
    
    var id: String?
    var name: String?
}

