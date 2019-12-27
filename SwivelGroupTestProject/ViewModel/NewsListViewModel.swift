//
//  NewsListViewModel.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/26/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation

class NewsListViewModel {

    // MARK: Class Variables
    var listArray: Array<News>?

    // MARK: Main Functions
    func getNewsList(completion: @escaping (Bool) -> Void) {
        NewsServiceClient.getNewsList { (result) in
            switch result {
            case .success(let news):
                self.listArray = news.articles
                completion(true)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: Extensions
extension NewsListViewModel {
    
    func getNumberOfRowForSection(section: Int) -> Int {
        return self.listArray?.count ?? 0
    }
}

extension NewsListViewModel {

    func getTitle(indexPath:IndexPath) -> String {
        return self.listArray?[indexPath.row].title ?? ""
    }

    func getImageUrl(indexPath: IndexPath) -> String {
        return (self.listArray?[indexPath.row].urlToImage) ?? ""
    }

    func getDescription(indexPath: IndexPath) -> String {
        return (self.listArray?[indexPath.row].description) ?? ""
    }

    func getUrl(indexPath: IndexPath) -> String {
        return (self.listArray?[indexPath.row].url) ?? ""
    }
    
}
