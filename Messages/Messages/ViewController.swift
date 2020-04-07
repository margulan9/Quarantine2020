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

class DateHeaderLabel: UILabel {
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
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
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
    
//    let chatMessages = [
//        [
//            ChatMessage(text: "Here is the first message is", isIncoming: true, date: Date.dateFromCustomString(customString: "01/04/2000")),
//            ChatMessage(text: "Here is the second message dudee", isIncoming: true, date: Date.dateFromCustomString(customString: "01/04/2000"))
//        ],
//        [
//            ChatMessage(text: "Now I am listening to xxxtentacion's music and it's amazing you know. I am relaxing while I am coding so fast because it is so satisfayin", isIncoming: false, date: Date.dateFromCustomString(customString: "04/04/2000")),
//            ChatMessage(text: "and of course my name is Margulan", isIncoming: false, date: Date.dateFromCustomString(customString: "04/04/2000"))
//        ],
//        [ChatMessage(text: "Here is the first message is", isIncoming: true, date: Date.dateFromCustomString(customString: "07/04/2000"))]
//    ]
    
    let messagesFromServer = [
        ChatMessage(text: "Here is the first message is", isIncoming: true, date: Date.dateFromCustomString(customString: "01/04/2000")),
        ChatMessage(text: "Here is the second message dudee", isIncoming: true, date: Date.dateFromCustomString(customString: "01/04/2000")),
        ChatMessage(text: "Now I am listening to xxxtentacion's music and it's amazing you know. I am relaxing while I am coding so fast because it is so satisfayin", isIncoming: false, date: Date.dateFromCustomString(customString: "04/04/2000")),
        ChatMessage(text: "and of course my name is Margulan", isIncoming: false, date: Date.dateFromCustomString(customString: "04/04/2000")),
        ChatMessage(text: "Here is the first message is", isIncoming: true, date: Date.dateFromCustomString(customString: "07/04/2000"))
    ]
    
    fileprivate func attemptToAssembleGroupedMessage() {
        print("works")
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            print(values ?? "")
            chatMessages.append(values ?? [])
        }
            
        
    }
    
    var chatMessages = [[ChatMessage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
        
        attemptToAssembleGroupedMessage()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let dateInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: dateInSection.date)
            let label = DateHeaderLabel()
            label.text = dateString
            
            
            let containterView = UIView()
            containterView.addSubview(label)
            label.centerYAnchor.constraint(equalTo: containterView.centerYAnchor).isActive = true
            label.centerXAnchor.constraint(equalTo: containterView.centerXAnchor).isActive = true
            
            
            return containterView
        }
        
        return nil
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//        return ""
//    }
    
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

