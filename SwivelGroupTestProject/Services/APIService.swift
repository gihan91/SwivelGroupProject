//
//  APIService.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/15/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation
import Alamofire

enum APIConfig: APIConfiguration {
    case showNewsList(parameters: Parameters)

    var method: HTTPMethod {
        switch self {
        case .showNewsList:
            return .get
        }
    }

    var path: String {
        switch self {
        case .showNewsList:
            return "v2/everything"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try ServerParams.baseUrl.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .showNewsList(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            //print(":::: url \(urlRequest)")
            return urlRequest
        }
    }
}
