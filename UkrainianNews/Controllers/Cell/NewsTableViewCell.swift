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

            NetworkManager.shared.fetchDataImage(url: news.urlToImage ?? "" ) { (image) in
                DispatchQueue.main.async {
                    self.newsImage?.image = image
                }
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
    }
}
