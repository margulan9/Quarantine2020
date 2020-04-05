//
//  ViewController.swift
//  PaintApp
//
//  Created by Sugirbay Margulan on 4/3/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    let tempImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bottomView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    let thirdBottomSubView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let undoButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetPressed), for: .touchUpInside)
        return button
    }()
    
    let redButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.tag = 1
        button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let greenButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.tag = 2
               button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let blackButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.tag = 4
               button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let blueButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tag = 3
               button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let pinkButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.tag = 6
               button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let orangeButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.tag = 5
               button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let brownButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brown
        button.tag = 8
               button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let grayButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.tag = 7
        button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
        return button
    }()
    
    let yellowButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.tag = 9
        button.addTarget(self, action: #selector(pencilPressed), for: .touchUpInside)
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
        title = "Color Pane"
    }
    
    func setUpLayots() {
        view.addSubview(tempImageView)
        tempImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tempImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tempImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tempImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(mainImageView)
        mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        view.addSubview(bottomView)
        bottomView.addSubview(thirdBottomSubView)
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            thirdBottomSubView.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.9),
            thirdBottomSubView.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 1),
            thirdBottomSubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        
        let colorControlStackView = UIStackView(arrangedSubviews: [
            redButton, greenButton, blueButton, blackButton, orangeButton, pinkButton, grayButton, brownButton,yellowButton, undoButton
        ])
        colorControlStackView.translatesAutoresizingMaskIntoConstraints = false
        colorControlStackView.distribution = .fillEqually
        colorControlStackView.spacing = 10
        view.addSubview(colorControlStackView)
        
        NSLayoutConstraint.activate([
            colorControlStackView.topAnchor.constraint(equalTo: thirdBottomSubView.topAnchor, constant: 32),
            colorControlStackView.leadingAnchor.constraint(equalTo: thirdBottomSubView.leadingAnchor, constant: 24),
            colorControlStackView.bottomAnchor.constraint(equalTo: thirdBottomSubView.bottomAnchor, constant: -32),
            colorControlStackView.trailingAnchor.constraint(equalTo: thirdBottomSubView.trailingAnchor, constant: -24)
        ])
        
       
    }
    
    @objc func pencilPressed(_ sender: UIButton) {
        guard let pencil = Pencil(tag: sender.tag) else {
          return
        }
        print(sender.tag)
        // 2
        color = pencil.color
    }
    
    @objc func resetPressed() {
        mainImageView.image = nil
    }


}

extension ViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }
      swiped = false
      lastPoint = touch.location(in: view)
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
      // 1
      UIGraphicsBeginImageContext(view.frame.size)
      guard let context = UIGraphicsGetCurrentContext() else {
        return
      }
      tempImageView.image?.draw(in: view.bounds)
        
      // 2
      context.move(to: fromPoint)
      context.addLine(to: toPoint)
      
      // 3
      context.setLineCap(.round)
      context.setBlendMode(.normal)
      context.setLineWidth(brushWidth)
      context.setStrokeColor(color.cgColor)
      
      // 4
      context.strokePath()
      
      // 5
      tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
      tempImageView.alpha = opacity
      UIGraphicsEndImageContext()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }

      // 6
      swiped = true
      let currentPoint = touch.location(in: view)
      drawLine(from: lastPoint, to: currentPoint)
        
      // 7
      lastPoint = currentPoint
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      if !swiped {
        // draw a single point
        drawLine(from: lastPoint, to: lastPoint)
      }
        
      // Merge tempImageView into mainImageView
      UIGraphicsBeginImageContext(mainImageView.frame.size)
      mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
      tempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
      mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
        
      tempImageView.image = nil
    }
    
}
