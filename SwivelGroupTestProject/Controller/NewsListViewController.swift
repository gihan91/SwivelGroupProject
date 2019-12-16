//
//  NewsListViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/15/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet var tblNewsList: UITableView!
    var listArray: Array<News>?


    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsList()
        self.tblNewsList.delegate = self
        self.tblNewsList.dataSource = self
        tblNewsList.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tblNewsList.reloadData()
    }

    func getNewsList() {
        NewsServiceClient.getNewsList { (result) in
            switch result {
            case .success(let news):
                self.listArray = news.articles
                if self.listArray?.count ?? 0 > 0 {
                    self.tblNewsList.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func goToNextViewController(imageUrl: URL, contentUrl: String, content: String, title: String) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let detailVC = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailViewController
        detailVC.contentTitle = title
        detailVC.content = content
        detailVC.contentImageUrl = imageUrl
        detailVC.contentUrl = contentUrl
        navigationController?.pushViewController(detailVC, animated: true)
       }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsListTableViewCell
        cell.setData(news: (self.listArray?[indexPath.row])!)
       let imageUrl = self.listArray?[indexPath.row].urlToImage
        if imageUrl != nil {
            DispatchQueue.main.async {
                cell.imgNews.load(url: imageUrl!)
            }
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedValue = self.listArray![indexPath.row]
        print(selectedValue.title)
        goToNextViewController(imageUrl: selectedValue.urlToImage!, contentUrl: selectedValue.url!, content: selectedValue.description!, title: selectedValue.title!)
    }
}

