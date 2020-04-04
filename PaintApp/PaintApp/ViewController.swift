//
//  ViewController.swift
//  PaintApp
//
//  Created by Sugirbay Margulan on 4/3/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bottomView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstBottomSubView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondBottomSubView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let thirdBottomSubView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let circleButton:UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "circle")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return button
    }()
    
    let squareButton:UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "rectangle")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return button
    }()
    
    let lineButton:UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "line")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return button
    }()
    
    let triangleButton:UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "triangle")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return button
    }()
    
    let pencilButton:UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "pen")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return button
    }()
    
    let undoButton:UIButton = {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "undo")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return button
    }()
    
    let redButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        return button
    }()
    
    let greenButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        return button
    }()
    
    let blackButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()
    
    let blueButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        return button
    }()
    
    let pinkButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        return button
    }()
    
    let orangeButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        return button
    }()
    
    let brownButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brown
        return button
    }()
    
    let grayButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        return button
    }()
    
    let fillLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fill"
        label.font = label.font.withSize(30)
        return label
    }()
    
    let fillSwitch: UISwitch = {
        let switchs = UISwitch()
        switchs.translatesAutoresizingMaskIntoConstraints = false
        return switchs
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUpLayots()
    }
    
    func setUpLayots() {
        view.addSubview(bottomView)
        bottomView.addSubview(firstBottomSubView)
        bottomView.addSubview(secondBottomSubView)
        bottomView.addSubview(thirdBottomSubView)
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 180),
            
            firstBottomSubView.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.9),
            firstBottomSubView.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.45),
            firstBottomSubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            secondBottomSubView.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.9),
            secondBottomSubView.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.1),
            secondBottomSubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            secondBottomSubView.leadingAnchor.constraint(equalTo: firstBottomSubView.trailingAnchor),
            
            thirdBottomSubView.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.9),
            thirdBottomSubView.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.45),
            thirdBottomSubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            thirdBottomSubView.leadingAnchor.constraint(equalTo: secondBottomSubView.trailingAnchor)
        ])
        
        let figureControlStackView = UIStackView(arrangedSubviews: [circleButton,squareButton,lineButton,triangleButton,pencilButton, undoButton])
        figureControlStackView.translatesAutoresizingMaskIntoConstraints = false
        figureControlStackView.distribution = .fillEqually
        figureControlStackView.spacing = 5
        view.addSubview(figureControlStackView)
        
        NSLayoutConstraint.activate([
            figureControlStackView.topAnchor.constraint(equalTo: firstBottomSubView.topAnchor, constant: 50),
            figureControlStackView.leadingAnchor.constraint(equalTo: firstBottomSubView.leadingAnchor, constant: 20),
            figureControlStackView.trailingAnchor.constraint(equalTo: firstBottomSubView.trailingAnchor, constant: -10),
            figureControlStackView.bottomAnchor.constraint(equalTo: firstBottomSubView.bottomAnchor, constant: -50)
            
        ])
        
        let colorControlStackView = UIStackView(arrangedSubviews: [
            redButton, greenButton, blueButton, blackButton, orangeButton, pinkButton, grayButton, brownButton
        ])
        colorControlStackView.translatesAutoresizingMaskIntoConstraints = false
        colorControlStackView.distribution = .fillEqually
        colorControlStackView.spacing = 10
        view.addSubview(colorControlStackView)
        
        NSLayoutConstraint.activate([
            colorControlStackView.topAnchor.constraint(equalTo: thirdBottomSubView.topAnchor, constant: 50),
            colorControlStackView.leadingAnchor.constraint(equalTo: thirdBottomSubView.leadingAnchor, constant: 10),
            colorControlStackView.bottomAnchor.constraint(equalTo: thirdBottomSubView.bottomAnchor, constant: -50),
            colorControlStackView.trailingAnchor.constraint(equalTo: thirdBottomSubView.trailingAnchor, constant: -20)
        ])
        
        let switchControlStackView = UIStackView(arrangedSubviews: [fillLabel, fillSwitch])
        switchControlStackView.translatesAutoresizingMaskIntoConstraints = false
        switchControlStackView.distribution = .fillEqually
        switchControlStackView.spacing = 5
        view.addSubview(switchControlStackView)
        
        NSLayoutConstraint.activate([
            switchControlStackView.centerXAnchor.constraint(equalTo: secondBottomSubView.centerXAnchor),
            switchControlStackView.centerYAnchor.constraint(equalTo: secondBottomSubView.centerYAnchor)
        ])
        
    }


}

