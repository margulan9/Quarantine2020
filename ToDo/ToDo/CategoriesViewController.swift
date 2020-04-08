//
//  CategoriesViewController.swift
//  ToDo
//
//  Created by Sugirbay Margulan on 4/8/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    var btn:CheckBox = {
        let button = CheckBox()
        button.style = .square
        button.borderStyle = .rounded
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkPressed), for: .touchUpInside)
        return button
    }()
//    var btn:UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .black
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("asd", for: .normal)
//        button.addTarget(self, action: #selector(checkPressed), for: .touchUpInside)
//        return button
//    }()
    
    @objc func checkPressed() {
        print("works")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(btn)
        
        
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Do any additional setup after loading the view.
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
