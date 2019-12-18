//
//  ShowHeadLineViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class ShowHeadLineViewController: UIViewController, SelectedKeyword {
    var selec: String?
    var cus: CustomeHeadLineViewController?
    func getSelectedKeyword(keyword: String?) {
        selec = keyword
    }


    @IBOutlet var tblHeadLine: UITableView!
    var listArray: Array<News>?


    override func viewDidLoad() {
        super.viewDidLoad()
        cus?.delegate = self
        getCustomeHeadLines()
        getHeadlineList()
        print(":::: selected keyword is \(selec)")
        self.tblHeadLine.delegate = self
        self.tblHeadLine.dataSource = self

        // Do any additional setup after loading the view.
    }

    func getHeadlineList() {
        NewsServiceClient.getHeadLineList { (result) in
            switch result {
            case .success(let news):
                self.listArray = news.articles
                if self.listArray?.count ?? 0 > 0 {
                    self.tblHeadLine.reloadData()

                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func getCustomeHeadLines() {
        NewsServiceClient.getNewsByKeyword(q: selec ?? "") { (result) in
            print(":::: selecuuu \(self.selec)")
            switch result {
            case .success(let news):
                self.listArray = news.articles
                if self.listArray?.count ?? 0 > 0 {
                    self.tblHeadLine.reloadData()

                }
            case .failure(let error):
                print(error)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tblHeadLine.reloadData()
        cus?.delegate = self
        print(":::: selected keyword is \(selec)")

    }

}

extension ShowHeadLineViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headLineListCell", for: indexPath) as! HeadLineListTableViewCell
        cell.setData(news: self.listArray![indexPath.row])
        let imageUrl = self.listArray?[indexPath.row].urlToImage
        if imageUrl != nil {
            DispatchQueue.main.async {
                cell.imgHeadLineImage.load(url: imageUrl!)
            }
        }
        return cell
    }


}
