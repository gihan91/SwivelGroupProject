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

    static func getNewsList (completion:@escaping (Result<Article, Error>)->Void) {
        AF.request(APIConfig.showNewsList(parameters: ["q":"bitcoin","from": "2019-12-18)","sortBy": "publishedAt", "apiKey" : "\(NewsManager.shared.requestApiKey())"])).responseDecodable { (response: DataResponse<Article>) in
            switch response.result {
            case .success:
                completion(response.result)
            case .failure(let err):
                print(err)
            }
        }
    }

    static func getHeadLineList (completion:@escaping (Result<Article, Error>)->Void) {
        AF.request(APIConfig.showNewsList(parameters: ["q":"bitcoin","from": "2019-12-18)","sortBy": "publishedAt", "apiKey" : "\(NewsManager.shared.requestApiKey())"])).responseDecodable { (response: DataResponse<Article>) in
            switch response.result {
            case .success:
                completion(response.result)
            case .failure(let err):
                print(err)
            }
        }
    }

    static func getNewsByKeyword (q: String, completion:@escaping (Result<Article, Error>)->Void) {
           AF.request(APIConfig.showNewsList(parameters: ["q":"bitcoin","from": "2019-12-18)","sortBy": "publishedAt", "apiKey" : "\(NewsManager.shared.requestApiKey())"])).responseDecodable { (response: DataResponse<Article>) in
               switch response.result {
               case .success:
                   completion(response.result)
               case .failure(let err):
                   print(err)
               }
           }
       }
}
