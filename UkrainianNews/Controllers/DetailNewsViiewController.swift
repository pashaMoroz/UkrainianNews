//
//  DetailNewsViiewController.swift
//  UkrainianNews
//
//  Created by Pavel Moroz on 17.12.2019.
//  Copyright © 2019 Pavel Moroz. All rights reserved.
//

import UIKit
import WebKit

class DetailNewsViiewController: UIViewController {

    var urlSite: String? 
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: self.urlSite ?? "") else { return }

             let request = URLRequest(url: url)

            self.webView.load(request)
    }
}
