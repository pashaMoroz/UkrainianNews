//
//  RandomCollectionViewCell.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 17.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import UIKit

class RandomCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!

    func configure(with news: Article, index: Int) {

        titleLabel.text = news.description

        DispatchQueue.global().async {

            NetworkManager.shared.fetchDataImage(url: news.urlToImage ?? "" ) { (image) in
                DispatchQueue.main.async {
                    self.imageView?.image = image
                }
            }
        }
    }

}
