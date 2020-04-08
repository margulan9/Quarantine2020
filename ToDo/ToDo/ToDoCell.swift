//
//  ToDoCell.swift
//  ToDo
//
//  Created by Sugirbay Margulan on 4/8/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    let cellView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    let todoLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let checkButton:CheckBox = {
        let button = CheckBox()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .tick
        button.borderStyle = .roundedSquare(radius: 8)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCellView() {
        addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        cellView.addSubview(todoLabel)
        
        todoLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16).isActive = true
        todoLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8).isActive = true
        todoLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -8).isActive = true
        todoLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.8).isActive = true
        
        cellView.addSubview(checkButton)
        checkButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
