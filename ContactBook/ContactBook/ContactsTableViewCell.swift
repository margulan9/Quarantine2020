//
//  ContactsTableViewCell.swift
//  ContactBook
//
//  Created by Sugirbay Margulan on 3/26/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    var contact: Contact? {
        didSet {
            guard let unwrappedContact = contact else {return}
            contactImageView.image = UIImage(named: unwrappedContact.imageName)
            let attributedName = NSMutableAttributedString(string: unwrappedContact.name, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
            let attributedNumber = NSMutableAttributedString(string: unwrappedContact.number, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
            nameLabel.attributedText = attributedName
            numberLabel.attributedText = attributedNumber
        }
    }
    
    let contactImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "chelsea-logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .darkGray
         return label
     }()
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayouts()
    }
  
    required init?(coder: NSCoder) {
        fatalError("error asd")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLayouts() {
//        let leadingImageViewContainer = UIView()
//        addSubview(leadingImageViewContainer)
//        leadingImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
//        leadingImageViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        leadingImageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        leadingImageViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        leadingImageViewContainer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
//
//        leadingImageViewContainer.addSubview(contactImageView)
//        contactImageView.centerYAnchor.constraint(equalTo: leadingImageViewContainer.centerYAnchor).isActive = true
//        contactImageView.centerXAnchor.constraint(equalTo: leadingImageViewContainer.centerXAnchor).isActive = true
//        contactImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
//
//        addSubview(nameLabel)
//        nameLabel.leadingAnchor.constraint(equalTo: leadingImageViewContainer.trailingAnchor, constant: 0).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
//        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
//        addSubview(numberLabel)
//        numberLabel.leadingAnchor.constraint(equalTo: leadingImageViewContainer.trailingAnchor, constant: 0).isActive = true
//        numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
//        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
//
//        addSubview(contactImageView)
//        contactImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
//        contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -40).isActive = true
//       
    }

}
