//
//  ShowHeadLineViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit
import SDWebImage

class ShowHeadLineViewController: UIViewController {

    // MARK: UI Reference
    @IBOutlet var tblHeadLine: UITableView!

    // MARK: Class Variables
    var headLinesViewModel = NewsHeadLinesViewModel()

    // MARK: Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblHeadLine.delegate = self
        self.tblHeadLine.dataSource = self
        getHeadLines()
    }
    // MARK: Actions
    private func getHeadLines() {
        headLinesViewModel.getHeadlineList { (success) in
            self.tblHeadLine.reloadData()
        }
    }
}

// MARK: Extensions
extension ShowHeadLineViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headLinesViewModel.getNumberOfRowForSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headLineListCell", for: indexPath) as! HeadLineListTableViewCell
        cell.lblHeadLineTitle.text = headLinesViewModel.getDescription(indexPath: indexPath)
        let imageUrl = headLinesViewModel.getImageUrl(indexPath: indexPath)
        cell.imgHeadLineImage.sd_setImage(with: URL(string: imageUrl)) { (image, err, tyoe, url) in
            cell.imgHeadLineImage.image = image
        }
        return cell
    }


}
