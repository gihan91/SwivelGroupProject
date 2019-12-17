//
//  ViewControllerExtention.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/18/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
