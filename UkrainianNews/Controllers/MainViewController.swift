//
//  ViewController.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 13.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import UIKit
import WebKit

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
    @IBOutlet var randomCollectionView: UICollectionView!
    
    private let newsActions = NewsActions.allCases
    private var news: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

    }

    override func viewWillAppear(_ animated: Bool) {
        NetworkManager.shared.fetchData(with: ApiLinks.getRandomLinks(.randomLink)()) { [weak self] (news) in
            self?.news = news.articles ?? []
            DispatchQueue.main.async {
                self?.randomCollectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return newsActions.count

        if collectionView == self.collectionView {
            
              return newsActions.count
        }
            return news.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.collectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsActionsCell
        cell.newsActionLabel.text = newsActions[indexPath.item].rawValue
        return cell
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! RandomCollectionViewCell
                let newsCell = news[indexPath.row]
                cell2.imageView?.image = UIImage(named: "news.png")
                cell2.configure(with: newsCell, index: indexPath.row)

            return cell2
        }

    }

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if collectionView == self.collectionView {
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

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsVC = segue.destination as! NewsTableViewController

        switch segue.identifier {
        case "ShowDetailBusiness":
            newsVC.stringApi = ApiLinks.getApiLinks(.business)()
            newsVC.title = NewsActions.business.rawValue
        case "ShowDetailEntertainment":
            newsVC.stringApi = ApiLinks.getApiLinks(.entertainment)()
            newsVC.title = NewsActions.entertainment.rawValue
        case "ShowDetailHealth":
            newsVC.stringApi = ApiLinks.getApiLinks(.health)()
            newsVC.title = NewsActions.health.rawValue
        case "ShowDetailScience":
            newsVC.stringApi = ApiLinks.getApiLinks(.science)()
            newsVC.title = NewsActions.science.rawValue
        case "ShowDetailSports":
            newsVC.stringApi = ApiLinks.getApiLinks(.sports)()
            newsVC.title = NewsActions.sports.rawValue
        case "ShowDetailTechnology":
            newsVC.stringApi = ApiLinks.getApiLinks(.technology)()
            newsVC.title = NewsActions.technology.rawValue
        default: break
        }
    }
}

