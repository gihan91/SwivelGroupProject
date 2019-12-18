//
//  DateUtil.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation

class DateUtil {
    static func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        print(":::: Date is \(result)")
        return result
    }
}
