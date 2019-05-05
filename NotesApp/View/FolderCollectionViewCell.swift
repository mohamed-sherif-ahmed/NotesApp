//
//  FolderCollectionViewCell.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/10/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class FolderCollectionViewCell: UITableViewCell {
    lazy var folderName: UILabel = {
        let fName = UILabel()
        fName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        fName.textColor = .black
        return fName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundView = UIView()
        backgroundView?.backgroundColor = .white
        backgroundView?.layer.cornerRadius = 5
        
        addSubview(backgroundView!)
        backgroundView!.addSubview(folderName)
        backgroundView?.layer.cornerRadius = 5
        backgroundView?.backgroundColor = .white
        backgroundView?.layer.shadowOpacity = 0.3
        backgroundView?.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        backgroundColor = UIColor(white: 1, alpha: 0)
        
        folderName.numberOfLines = 0
        
        folderName.translatesAutoresizingMaskIntoConstraints = false
        backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        
        [backgroundView?.topAnchor.constraint(equalTo: topAnchor, constant: 10),
         backgroundView?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
         backgroundView?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         backgroundView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
         folderName.topAnchor.constraint(equalTo: backgroundView!.topAnchor, constant: 10),
         folderName.leadingAnchor.constraint(equalTo: backgroundView!.leadingAnchor, constant: 10),
         folderName.trailingAnchor.constraint(equalTo: backgroundView!.trailingAnchor, constant: -10),
            folderName.bottomAnchor.constraint(equalTo: backgroundView!.bottomAnchor, constant: -10)
         ].forEach{$0?.isActive = true}
        
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted == true {
            backgroundView?.backgroundColor = .gray
        } else {
            backgroundView?.backgroundColor = .white
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
