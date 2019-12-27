//
//  CustomeHeaderTableViewCell.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/27/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class CustomeHeaderTableViewCell: UITableViewCell {

    @IBOutlet var imgCustomeHeaderImage: UIImageView!
    @IBOutlet var lblCustomeHeaderTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
