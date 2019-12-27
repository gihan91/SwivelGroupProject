//
//  NewsHeadLinesListViewModel.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/27/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation

class NewsHeadLinesViewModel {

    // MARK: Class Variables
    var listOfHeadLineArray: Array<News>?

    // MARK: Main Functions
    func getHeadlineList(completion: @escaping (Bool) -> Void) {
        NewsServiceClient.getHeadLineList { (result) in
            switch result {
            case .success(let news):
                self.listOfHeadLineArray = news.articles
                completion(true)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: Extensions
extension NewsHeadLinesViewModel {

    func getNumberOfSection() -> Int {
        return 1
    }

    func getNumberOfRowForSection(section: Int) -> Int {
        return self.listOfHeadLineArray?.count ?? 0
    }
}

extension NewsHeadLinesViewModel {

    func getDescription(indexPath: IndexPath) -> String {
        return (self.listOfHeadLineArray?[indexPath.row].description) ?? ""
    }

    func getImageUrl(indexPath: IndexPath) -> String {
        return (self.listOfHeadLineArray?[indexPath.row].urlToImage) ?? ""
    }
}
