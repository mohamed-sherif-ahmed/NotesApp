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
//        backgroundColor = .gray
        addSubview(folderName)
        folderName.translatesAutoresizingMaskIntoConstraints = false
        [folderName.centerXAnchor.constraint(equalTo: centerXAnchor),
         folderName.centerYAnchor.constraint(equalTo: centerYAnchor)].forEach{$0.isActive = true}
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
