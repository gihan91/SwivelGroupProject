//
//  WelcomeViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/17/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit
import RealmSwift

class WelcomeViewController: UIViewController {

    @IBOutlet var lblShowName: UILabel!

    var realm: Realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

    }

    func getData() {
        let user = realm.objects(User.self)
        for user in user {
            self.lblShowName.text = "Hi" + " " + "\(user.userName)"
        }


    }

}
