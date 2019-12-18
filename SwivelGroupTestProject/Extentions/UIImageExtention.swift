//
//  UIImageExtention.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
