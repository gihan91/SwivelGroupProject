//
//  NewsListViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/15/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit
import SDWebImage

class NewsListViewController: UIViewController {

    // MARK: UI Reference
    @IBOutlet var tblNewsList: UITableView!

    // MARK: Class Variables
    var newsListViewModel = NewsListViewModel()

    // MARK: Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblNewsList.delegate = self
        self.tblNewsList.dataSource = self
        tblNewsList.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        getNewsList()
    }

    // MARK: Actions
    private func getNewsList() {
        newsListViewModel.getNewsList {_ in
            self.tblNewsList.reloadData()
        }
    }

    func goToNextViewController(imageUrl: String, contentUrl: String, content: String, title: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailViewController
        detailVC.contentTitle = title
        detailVC.content = content
        detailVC.contentImageUrl = imageUrl
        detailVC.contentUrl = contentUrl
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: Extensions
extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsListViewModel.getNumberOfRowForSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsListTableViewCell
        cell.lblTitle.text = newsListViewModel.getTitle(indexPath: indexPath)
        let imageUrl = newsListViewModel.getImageUrl(indexPath: indexPath)
        cell.imgNews.sd_setImage(with: URL(string: imageUrl)) { (image, err, tyoe, url) in
            cell.imgNews.image = image
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToNextViewController(imageUrl: newsListViewModel.getImageUrl(indexPath: indexPath), contentUrl: newsListViewModel.getUrl(indexPath: indexPath), content: newsListViewModel.getDescription(indexPath: indexPath), title: newsListViewModel.getTitle(indexPath: indexPath))
    }
}

