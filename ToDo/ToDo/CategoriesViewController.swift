//
//  CategoriesViewController.swift
//  ToDo
//
//  Created by Sugirbay Margulan on 4/8/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

struct Category {
    let category: String
    let todo: String
    let isChecked:Bool
}

class CategoryLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        textColor = .white
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = 5
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
}


class CategoriesViewController: UIViewController {

    let sortButton:CustomButton = {
        let button = CustomButton(type: .system)
        let image = UIImage(named: "down-arrow")
        let resizedImg = image!.resized(to: CGSize(width: 12, height: 12))
        button.setImage(resizedImg, for: .normal)
        button.setTitle("sort ", for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(sortPressed), for: .touchUpInside)
        return button
    }()
    
    let sortView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = true
        return view
    }()
    
    let tableView = UITableView()
    var toDoCategories = [[Category]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        toDoCategories = [
            [Category(category: "routine", todo: "To finish to do App", isChecked: false),
             Category(category: "routine", todo: "To finish to do App also finish sort part and add other useful features", isChecked: false),
            Category(category: "routine", todo: "To finish to do App", isChecked: false),
            Category(category: "routine", todo: "To finish to do App", isChecked: false)],
            [Category(category: "sport", todo: "To finish to do App", isChecked: false)],
            [Category(category: "iOS", todo: "To finish to do App", isChecked: false)],
            [Category(category: "edu", todo: "To finish to do App", isChecked: false),
            Category(category: "edu", todo: "To finish to do App", isChecked: false)],
            [Category(category: "health", todo: "To finish to do App", isChecked: false),
            Category(category: "health", todo: "To finish to do App", isChecked: false)]
        ]
        
        setUpLayouts()
    }
    
    func setUpLayouts() {
        view.addSubview(sortButton)
        sortButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        sortButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22).isActive = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: sortButton.bottomAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        
        setUpTableView()
        
        view.addSubview(sortView)
        sortView.topAnchor.constraint(equalTo: sortButton.bottomAnchor, constant: 8).isActive = true
        sortView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sortView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        sortView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: "cellId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    @objc func sortPressed() {
        sortView.isHidden = false
    }
    
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return toDoCategories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoCategories[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CategoriesCell
        let categories = toDoCategories[indexPath.section][indexPath.row]
        cell.categories = categories
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let categoryInSection = toDoCategories[section].first {
            let label = CategoryLabel()
            label.text = categoryInSection.category
            
            let containerView = UIView()
            containerView.addSubview(label)
            containerView.alpha = 0.7
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4).isActive = true
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 1).isActive = true
            label.widthAnchor.constraint(equalToConstant: 100).isActive = true
            return containerView
        }
        return nil
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        34
    }
    
    
}

class CustomButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()

        guard imageView != nil else {
         return
        }
        
        let btnWidth = self.frame.width
        let imgWidth = imageView!.frame.width
        
        imageEdgeInsets = UIEdgeInsets(top: 4, left: btnWidth - imgWidth, bottom: 0, right: -(btnWidth - imgWidth))
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -imgWidth, bottom: 0, right: imgWidth)

     }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

