//
//  NewContactViewController.swift
//  ContactBook
//
//  Created by Sugirbay Margulan on 3/26/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

protocol addContact {
    func add(contact: Contact)
}

class NewContactViewController: UIViewController {
    
    var pickerData = ["male", "female"]
    var delegate:addContact?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New contact"
        self.genderPickerView.delegate = self
        self.genderPickerView.dataSource = self
        setupLayouts()
        
        
    }
    
    var genderPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    var numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Number"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADD", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(addNewContact), for: .touchUpInside)
        return button
    }()
    
    @objc func addNewContact() {
        let gender = pickerData[genderPickerView.selectedRow(inComponent: 0)]
        let name = nameTextField.text
        let number = numberTextField.text
        let newContact = Contact(imageName: gender, name: name!, number: number!)
        delegate?.add(contact: newContact)
        print(newContact)
        
    }
    
//    @IBAction func save(_ sender: Any) {
//          let editedTime = "\(hours):\(minutes)"
//          let title = textField.text!
//          let currentAlarm = Alarm(time: editedTime, description: title, switchs: false)
//          delegate?.add(alarm: currentAlarm)
//          self.dismiss(animated: true, completion: nil)
//          print(currentAlarm)
//      }
    
    func setupLayouts() {
        view.addSubview(genderPickerView)
        genderPickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        genderPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        genderPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: genderPickerView.bottomAnchor, constant: 0).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        view.addSubview(numberTextField)
        numberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        view.addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 40).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
     
    }
}

extension NewContactViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }
    
    
}
