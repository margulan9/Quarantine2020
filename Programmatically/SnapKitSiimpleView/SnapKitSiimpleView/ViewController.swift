//
//  ViewController.swift
//  SnapKitSiimpleView
//
//  Created by Sugirbay Margulan on 4/13/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var yellowBox: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 50
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    var blackBox: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSnapKitLayout()
    }
    
    func setupSnapKitLayout() {
        self.view.addSubview(yellowBox)
        yellowBox.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(view.snp.center)
        }
        self.view.addSubview(blackBox)
        blackBox.snp.makeConstraints { (make) in
            make.width.equalTo(yellowBox.snp.width).multipliedBy(0.5)
            make.height.equalTo(blackBox.snp.width)
            make.center.equalTo(view.snp.center)
        }
    }


}

