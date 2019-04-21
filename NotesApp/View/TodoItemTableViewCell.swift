//
//  TodoItemTableViewCell.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 4/20/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {
    var status = false
    var titleString: String?
    
    lazy var imgCheck: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "offChecked").withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var todoTitle: UITextField = {
        let tv = UITextField()
        tv.text = "Note Title !"
        tv.textColor = .black
        tv.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        tv.isEnabled = false
        return tv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imgCheck)
        addSubview(todoTitle)
        imgCheck.translatesAutoresizingMaskIntoConstraints = false
        todoTitle.translatesAutoresizingMaskIntoConstraints = false
        [imgCheck.leadingAnchor.constraint(equalTo: leadingAnchor),
         imgCheck.trailingAnchor.constraint(equalTo: todoTitle.leadingAnchor),
         imgCheck.topAnchor.constraint(equalTo: topAnchor),
         imgCheck.bottomAnchor.constraint(equalTo: bottomAnchor),
         imgCheck.widthAnchor.constraint(equalToConstant: 50),
         todoTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
         todoTitle.heightAnchor.constraint(equalToConstant: 40),
         todoTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
         
         todoTitle.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach {$0.isActive = true}
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            imgCheck.image = #imageLiteral(resourceName: "onCheck").withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5))
            let att: [NSAttributedString.Key: Any] = [NSAttributedString.Key.strikethroughStyle: 2, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)]
            let attString = NSAttributedString(string: titleString!, attributes: att)
            todoTitle.text = nil
            todoTitle.attributedText = attString
            status = true
        } else {
            imgCheck.image = #imageLiteral(resourceName: "offChecked").withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5))
            todoTitle.attributedText = NSAttributedString(string: titleString!, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)])
            status = false
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setTodoTitle(_ name: String) {
        titleString = name
        todoTitle.text = name
    }
    
    func toogleStatus() {
//        if !status {
//            imgCheck.image = #imageLiteral(resourceName: "onCheck").withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5))
//            let att: [NSAttributedString.Key: Any] = [NSAttributedString.Key.strikethroughStyle: 2, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)]
//            let attString = NSAttributedString(string: titleString!, attributes: att)
//            todoTitle.text = nil
//            todoTitle.attributedText = attString
//            status = true
//        } else {
//            imgCheck.image = #imageLiteral(resourceName: "offChecked").withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5))
//            todoTitle.attributedText = NSAttributedString(string: titleString!, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)])
//            status = false
//        }
       
    }
}
