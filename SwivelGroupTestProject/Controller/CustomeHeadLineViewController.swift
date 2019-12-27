//
//  CustomeHeadLineViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

class CustomeHeadLineViewController: UIViewController {

    // MARK: UI Reference
    @IBOutlet var tblCustomeHeader: UITableView!
    @IBOutlet var txtKeywordSelection: UITextField!

    // MARK: Class Variables
    var customeHeadLineViewModel = CustomeNewsViewModel()
    let keywords = ["bitcoin",
                "apple",
                "earthquake",
                "animal"
                ]

    var selectedKeyword: String?

    // MARK: Main Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        createToolbar()
        self.tblCustomeHeader.delegate = self
        self.tblCustomeHeader.dataSource = self

    }

     // MARK: Util functions
    func createDayPicker() {

        let dayPicker = UIPickerView()
        dayPicker.delegate = self

        txtKeywordSelection.inputView = dayPicker

        //Customizations
        dayPicker.backgroundColor = .black
    }


    func createToolbar() {

        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CustomeHeadLineViewController.dismissKeyboard))

        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        txtKeywordSelection.inputAccessoryView = toolBar
    }


    @objc override func dismissKeyboard() {
        view.endEditing(true)
    }

}
// MARK: Extensions
extension CustomeHeadLineViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keywords.count
    }


    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keywords[row]
    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

//        selectedKeyword = keywords[row]
        guard let selectedKeyword: String = keywords[row] else {
            return
        }
            txtKeywordSelection.text = selectedKeyword
        customeHeadLineViewModel.getCustomeHeadLines(selectedKeyword: selectedKeyword ) { (success) in
            self.tblCustomeHeader.reloadData()
        }

    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var label: UILabel

        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }

        label.textColor = .green
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)

        label.text = keywords[row]

        return label
    }
}

extension CustomeHeadLineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customeHeadLineViewModel.getNumberOfRowForSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "customeHeaderCell", for: indexPath) as! CustomeHeaderTableViewCell
        let imageUrl = customeHeadLineViewModel.getImageUrl(indexPath: indexPath)
        cell.imgCustomeHeaderImage.sd_setImage(with: URL(string: imageUrl)) { (image, err, tyoe, url) in
            cell.imgCustomeHeaderImage.image = image
        }
        cell.lblCustomeHeaderTitle.text = customeHeadLineViewModel.getDescription(indexPath: indexPath)
        return cell
    }



}

