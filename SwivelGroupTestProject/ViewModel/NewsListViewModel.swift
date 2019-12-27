//
//  NewsListViewModel.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/26/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation

class NewsListViewModel {
    
    var listArray: Array<News>?

    func getNewsList(completion: @escaping () -> Void) {
        NewsServiceClient.getNewsList { (result) in
            switch result {
            case .success(let news):
                self.listArray = news.articles
                if self.listArray?.count ?? 0 > 0 {

                }
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension NewsListViewModel {
    func getNumberOfSection() -> Int {
        return 1
    }

    func getNumberOfRowForSection(section: Int) -> Int {
        return self.listArray?.count ?? 0
    }
}

extension NewsListViewModel {

    func getTitle(indexPath:IndexPath) -> String {
           return self.listArray?[indexPath.row].title ?? ""
       }

    func getImageUrl(indexPath: IndexPath) -> URL {
        return (self.listArray?[indexPath.row].urlToImage)!
    }
}
