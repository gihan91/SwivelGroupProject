//
//  UserDAO.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/17/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var userName = ""
    @objc dynamic var password = ""
}
