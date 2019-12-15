//
//  ViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/15/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrayNews = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NewsServiceClient.getNewsList { (result) in
            switch result {

            case .success(let news):
                var list = news.articles
                for alldata in list! {
                    print(alldata.title)
                }
            case .failure(let error):
                print(error)
            }
        }
    }


}

