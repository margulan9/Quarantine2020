//
//  ViewController.swift
//  ContactBook
//
//  Created by Sugirbay Margulan on 3/26/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
   
    var contacts = [Contact(imageName: "chelsea-logo", name: "Margulan Sugirbay", number: "88888888888"),
    Contact(imageName: "chelsea-logo", name: "Margulan Sugirbay", number: "88888888888"),Contact(imageName: "chelsea-logo", name: "Margulan Sugirbay", number: "88888888888")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.title = "Contacts"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = add
        setUpTableView()
        myTableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: "ContactCell")
   
    }
    
    @objc func logoutUser(){
        let newContactViewController = NewContactViewController()
        self.navigationController?.pushViewController(newContactViewController, animated: true)
    }

    func setUpTableView() {
        let barHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           contacts.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactsTableViewCell
        let contact = contacts[indexPath.row]
        cell.contact = contact
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
       
 


}

