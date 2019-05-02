//
//  FolderCollectionViewCell.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/10/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class FolderCollectionViewCell: UICollectionViewCell {
    lazy var folderName: UILabel = {
        let fName = UILabel()
        fName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        fName.textColor = .black
        return fName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundView = UIView()
        backgroundView?.backgroundColor = .white
        backgroundView?.layer.cornerRadius = 5
        addSubview(backgroundView!)
        addSubview(folderName)
        
        folderName.translatesAutoresizingMaskIntoConstraints = false
        [folderName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
         folderName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         folderName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
         backgroundView?.topAnchor.constraint(equalTo: topAnchor),
         backgroundView?.bottomAnchor.constraint(equalTo: bottomAnchor),
         backgroundView?.leadingAnchor.constraint(equalTo: leadingAnchor),
         backgroundView?.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0?.isActive = true}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
