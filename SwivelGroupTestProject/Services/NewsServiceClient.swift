//
//  NewsServiceClient.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/15/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation
import Alamofire

class NewsServiceClient {
//    let params = [String: Any] = ["q": "bitcoin",
//            "from" : "2019-11-15",
//            "sortBy" : "publishedAt",
//            "apiKey" : "437aa887e45f4fcca35be5efe3115a28"
//    ]

    static func getNewsList (completion:@escaping (Result<Article, Error>)->Void) {
        AF.request(APIConfig.showNewsList(parameters: ["q":"bitcoin","from": "2019-11-15","sortBy": "publishedAt", "apiKey" : "437aa887e45f4fcca35be5efe3115a28"])).responseDecodable { (response: DataResponse<Article>) in
            switch response.result {
            case .success:
                completion(response.result)
            case .failure(let err):
                print(err)
            }
        }
    }
}
