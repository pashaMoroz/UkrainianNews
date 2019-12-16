//
//  NewsTableViewController.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 15.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    private var news: [Article] = []
    var stringApi = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 150
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        NetworkManager.shared.fetchData(with: stringApi) { [weak self] (news) in

            self?.news = news.articles ?? []
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell

        let newsCell = news[indexPath.row]
        cell.configure(with: newsCell, index: indexPath.row)
        return cell
    }

}
