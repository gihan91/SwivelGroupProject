//
//  HeadLineListTableViewCell.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class HeadLineListTableViewCell: UITableViewCell {

    @IBOutlet var lblHeadLineTitle: UILabel!
    @IBOutlet var imgHeadLineImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(news: News) {
        self.lblHeadLineTitle.text = news.description
    }

}
