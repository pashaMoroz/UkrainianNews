//
//  ViewController.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 13.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import UIKit

enum NewsActions: String, CaseIterable {
    case business = "Бизнес"
    case entertainment = "Разное"
    case health = "Здоровье"
    case science = "Наука"
    case sports = "Спорт"
    case technology = "Технологии"
}

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    private let newsActions = NewsActions.allCases

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsActions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsActionsCell

        cell.newsActionLabel.text = newsActions[indexPath.item].rawValue

        return cell
    }

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newsAction = newsActions[indexPath.item]

        switch newsAction {
        case .business:
            performSegue(withIdentifier: "ShowDetailBusiness", sender: nil)
        case .entertainment:
            performSegue(withIdentifier: "ShowDetailEntertainment", sender: nil)
        case .health:
            performSegue(withIdentifier: "ShowDetailHealth", sender: nil)
        case .science:
            performSegue(withIdentifier: "ShowDetailScience", sender: nil)
        case .sports:
            performSegue(withIdentifier: "ShowDetailSports", sender: nil)
        case .technology:
            performSegue(withIdentifier: "ShowDetailTechnology", sender: nil)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsVC = segue.destination as! NewsTableViewController

        switch segue.identifier {
        case "ShowDetailBusiness":
            newsVC.stringApi = ApiLinks.getApiLinks(.business)()
        case "ShowDetailEntertainment":
            newsVC.stringApi = ApiLinks.getApiLinks(.entertainment)()
        case "ShowDetailHealth":
            newsVC.stringApi = ApiLinks.getApiLinks(.health)()
        case "ShowDetailScience":
            newsVC.stringApi = ApiLinks.getApiLinks(.science)()
        case "ShowDetailSports":
            newsVC.stringApi = ApiLinks.getApiLinks(.sports)()
        case "ShowDetailTechnology":
            newsVC.stringApi = ApiLinks.getApiLinks(.technology)()
        default: break
        }

    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
