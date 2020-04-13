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
   
    let tableView = UITableView()
    var toDoFromMainPage = [Category]()
    var toDoCategories = [[Category]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Categories"
        view.backgroundColor = .white
        

        print(toDoFromMainPage)
        attemptToAssembleGroupedMessage()
        setUpLayouts()
    }
    
    func attemptToAssembleGroupedMessage() {
    
           let groupedMessages = Dictionary(grouping: toDoFromMainPage) { (element) -> String in
            return element.category
           }
           
           let sortedKeys = groupedMessages.keys.sorted()
           sortedKeys.forEach { (key) in
               let values = groupedMessages[key]
               toDoCategories.append(values ?? [])
           }
               
           
       }
    
    func setUpLayouts() {
       
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        
        setUpTableView()
        
        
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: "cellId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
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

