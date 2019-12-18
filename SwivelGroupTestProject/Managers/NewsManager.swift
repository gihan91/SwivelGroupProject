//
//  NewsManager.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation

class NewsManager {
    static let shared = NewsManager()

    func requestApiKey() -> String {
        let API_KEY = "437aa887e45f4fcca35be5efe3115a28"
        return API_KEY
    }
}
