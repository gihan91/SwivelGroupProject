//
//  News.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/15/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation

struct News: Codable {
     var title: String?
     var urlToImage: URL?
     var description: String?
     var url: String?

    init(title: String, urlToImage: URL) {
        self.title = title
        self.urlToImage = urlToImage
    }
}
