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
    
    // MARK: UI Reference
    @IBOutlet var lblPassword: UITextField!
    @IBOutlet var lblUserName: UITextField!
    
    // MARK: Class Variables
    var realm: Realm = try! Realm()
    
    // MARK: Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
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
    
    // MARK: Actions
    @IBAction func actionLogin(_ sender: Any) {
        saveUser()
    }
    
}
