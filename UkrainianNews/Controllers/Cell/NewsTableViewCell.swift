//
//  NewsTableViewCell.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 15.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

@IBOutlet var newsImage: UIImageView!
@IBOutlet var newsTitle: UILabel!
@IBOutlet var newsDescript: UILabel!
    
    func configure(with news: Article, index: Int) {

        newsTitle.text = news.title
        newsDescript.text = news.description

        DispatchQueue.global().async {
            guard let stringURL = news.urlToImage else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.newsImage.image = UIImage(data: imageData)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
    }
}
