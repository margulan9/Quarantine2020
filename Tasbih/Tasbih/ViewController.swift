//
//  ViewController.swift
//  Tasbih
//
//  Created by Sugirbay Margulan on 4/14/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let counterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.borderColor = #colorLiteral(red: 0.6274509804, green: 0.6745098039, blue: 0.7411764706, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    let wordsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.borderColor = #colorLiteral(red: 0.6274509804, green: 0.6745098039, blue: 0.7411764706, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.masksToBounds = true
        return view
    }()

    let btn1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.add, for: .normal)
        button.tintColor = .black
        return button
    }()
    let btn2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.add, for: .normal)
        return button
    }()
    let btn3: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(.add, for: .normal)
           return button
       }()
    let btn4: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(.add, for: .normal)
           return button
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupLayouts()
    }

    
    func setupLayouts() {
        view.addSubview(counterView)
        counterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        counterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64).isActive = true
        counterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        counterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "33"
        label.font = UIFont.systemFont(ofSize: 80, weight: .light)
        label.textColor = #colorLiteral(red: 0.4, green: 0.4392156863, blue: 0.4901960784, alpha: 1)

        counterView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: counterView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: counterView.centerYAnchor).isActive = true

        view.addSubview(wordsView)
        wordsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wordsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        wordsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        wordsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true

        let stackView = UIStackView(arrangedSubviews: [btn1, btn2, btn3, btn4])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.backgroundColor = .black
        view.addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: wordsView.bottomAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: counterView.topAnchor, constant: -10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
    }


}

