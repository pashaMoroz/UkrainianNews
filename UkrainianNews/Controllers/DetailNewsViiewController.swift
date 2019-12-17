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

    var urlSite = ""
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: urlSite)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
