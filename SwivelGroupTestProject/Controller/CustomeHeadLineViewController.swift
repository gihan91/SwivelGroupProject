//
//  CustomeHeadLineViewController.swift
//  SwivelGroupTestProject
//
//  Created by Gihan on 12/16/19.
//  Copyright © 2019 Gihan. All rights reserved.
//

import UIKit

protocol SelectedKeyword {
    func getSelectedKeyword(keyword: String?)
}

class CustomeHeadLineViewController: UIViewController {

    @IBOutlet var txtKeywordSelection: UITextField!

    let keywords = ["bitcoin",
                "apple",
                "earthquake",
                "animal"
                ]

    var selectedKeyword: String?

    var delegate: SelectedKeyword? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        createToolbar()
    }

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
        delegate?.getSelectedKeyword(keyword: selectedKeyword)
        print(":::: seeelc \(selectedKeyword)")

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

