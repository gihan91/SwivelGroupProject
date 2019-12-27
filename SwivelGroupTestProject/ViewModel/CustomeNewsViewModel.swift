//
//  CustomeNewsViewModel.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/27/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation

class CustomeNewsViewModel {

    // MARK: Class Variables
    var customeNewslistArray: Array<News>?

    // MARK: Main Functions
    func getCustomeHeadLines(selectedKeyword: String, completion: @escaping (Bool) -> Void) {
        NewsServiceClient.getNewsByKeyword(q: selectedKeyword) { (result) in
            switch result {
            case .success(let news):
                self.customeNewslistArray = news.articles
                completion(true)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: Extensions
extension CustomeNewsViewModel {

    func getNumberOfSection() -> Int {
        return 1
    }

    func getNumberOfRowForSection(section: Int) -> Int {
        return self.customeNewslistArray?.count ?? 0
    }
}

extension CustomeNewsViewModel {

    func getDescription(indexPath: IndexPath) -> String {
        return (self.customeNewslistArray?[indexPath.row].description) ?? ""
    }

    func getImageUrl(indexPath: IndexPath) -> String {
        return (self.customeNewslistArray?[indexPath.row].urlToImage) ?? ""
    }
}
