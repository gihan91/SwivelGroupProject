//
//  ProfileViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/17/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {
    var realm: Realm = try! Realm()

    @IBOutlet var lblPassword: UITextField!
    @IBOutlet var lblUserName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    public func saveUser()
    {
        let userObj = User()
        userObj.userName = lblUserName.text ?? "No Name"
        userObj.password = lblPassword.text ?? "No password"

        try! self.realm.write {
            self.realm.add(userObj)
        }
    }

    @IBAction func actionLogin(_ sender: Any) {
        saveUser()
    }

}
