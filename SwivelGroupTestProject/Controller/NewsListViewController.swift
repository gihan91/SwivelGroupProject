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

    var newsListViewModel = NewsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblNewsList.delegate = self
        self.tblNewsList.dataSource = self
        tblNewsList.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        newsListViewModel.getNewsList {
            self.tblNewsList.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tblNewsList.reloadData()
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
        return self.newsListViewModel.getNumberOfRowForSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsListTableViewCell
        cell.lblTitle.text = newsListViewModel.getTitle(indexPath: indexPath)
        let imageUrl = newsListViewModel.getImageUrl(indexPath: indexPath)
        if imageUrl != nil {
            DispatchQueue.main.async {
                cell.imgNews.load(url: imageUrl)
            }
        }

        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var selectedValue = self.newsListViewModel.listArray?[indexPath.row]
//        guard selectedValue?.urlToImage != nil, selectedValue?.url != nil, selectedValue?.description != nil, selectedValue?.title != nil else {
//            return
//        }
//        goToNextViewController(imageUrl: selectedValue?.urlToImage! ?? <#default value#>, contentUrl: selectedValue?.url! ?? <#default value#>, content: selectedValue?.description! ?? <#default value#>, title: selectedValue?.title! ?? <#default value#>)
//    }
}

