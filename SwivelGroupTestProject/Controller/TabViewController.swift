//
//  TabViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    var previousTag: Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func present(_ viewControllerToPresent: UIViewController,
                             animated flag: Bool,
                             completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalTransitionStyle = .coverVertical
         super.present(viewControllerToPresent, animated: flag, completion: completion)
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
