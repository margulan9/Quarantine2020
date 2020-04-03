//
//  ViewController.swift
//  NavigationControllerProgrammatic
//
//  Created by Sugirbay Margulan on 4/3/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let nextButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGray
        title = "First"
        setUpNextButton()
        setUpNextButtonConstraint()
    }
    
    func setUpNextButton() {
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.layer.cornerRadius = 10
        
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        
        view.addSubview(nextButton)
    }
    
    func setUpNextButtonConstraint() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func nextButtonPressed() {
        let secondScreen = SecondViewController()
        secondScreen.title = "Second"
        navigationController?.pushViewController(secondScreen, animated: true)
    }
}

