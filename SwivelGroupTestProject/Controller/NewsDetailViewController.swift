//
//  NewsDetailViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    var contentTitle: String?
    var contentUrl: String?
    var contentImageUrl: URL?
    var content: String?

    @IBOutlet var imgNews: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var txtViewUrl: UITextView!
    @IBOutlet var txtViewContent: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
        txtViewUrl.isEditable = false
        txtViewUrl.dataDetectorTypes = UIDataDetectorTypes.link
    }
    private func updateUi(){
        DispatchQueue.main.async {
            guard self.content != nil, self.contentImageUrl != nil, self.contentTitle != nil, self.contentUrl != nil else {
                return
            }
            self.lblTitle.text = self.contentTitle
            self.imgNews.load(url: self.contentImageUrl!)
            self.txtViewContent.text = self.content
            self.txtViewUrl.text = self.contentUrl
        }
    }
    @IBAction func actionGoToHeadLine(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "tabVC") as! TabViewController
        self.navigationController?.pushViewController(viewController, animated: true)
//        self.present(viewController, animated: true, completion: nil)
    }

}
