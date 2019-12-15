//
//  APIConfigurationManager.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/15/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
}
