//
//  ViewController.swift
//  Messages
//
//  Created by Sugirbay Margulan on 4/6/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {
    
    let cellId = "id"
    
    let chatMessages = [
        [
            ChatMessage(text: "Here is the first message is", isIncoming: true, date: Date.dateFromCustomString(customString: "01/04/2000")),
            ChatMessage(text: "Here is the second message dudee", isIncoming: true, date: Date.dateFromCustomString(customString: "01/04/2000"))
        ],
        [
            ChatMessage(text: "Now I am listening to xxxtentacion's music and it's amazing you know. I am relaxing while I am coding so fast because it is so satisfayin", isIncoming: false, date: Date.dateFromCustomString(customString: "04/04/2000")),
            ChatMessage(text: "and of course my name is Margulan", isIncoming: false, date: Date.dateFromCustomString(customString: "04/04/2000"))
        ],
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let dateInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: dateInSection.date)
            return dateString
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        return cell
    }


}

