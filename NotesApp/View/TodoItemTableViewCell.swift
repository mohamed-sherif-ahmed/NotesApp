//
//  TodoItemTableViewCell.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 4/20/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {
    let checkedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.strikethroughStyle: 2, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)]
    let uncheckedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)]
    
    lazy var imgCheck: UIImageView = {
        let img = UIImageView()
        img.image = applyImageInsets(to: #imageLiteral(resourceName: "offChecked"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var todoTitle: UITextField = {
        let tv = UITextField()
        tv.textColor = .black
        tv.attributedText = NSAttributedString(string: "", attributes: uncheckedAttributes)
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
            imgCheck.image = applyImageInsets(to: #imageLiteral(resourceName: "onCheck"))
            let attString = NSAttributedString(string: todoTitle.attributedText!.string, attributes: checkedAttributes)
            todoTitle.attributedText = attString
        } else {
            imgCheck.image = applyImageInsets(to: #imageLiteral(resourceName: "offChecked"))
            todoTitle.attributedText = NSAttributedString(string: todoTitle.attributedText!.string, attributes: uncheckedAttributes)
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyImageInsets(to img: UIImage) -> UIImage {
        return img.withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5))
    }
}
//
//extension TodoItemTableViewCell: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        todoItem?.itemTitle = textField.text
//        textField.isEnabled = false
//        do{
//            try AppDelegate.viewContext.save()
//        } catch {
//            print("?")
//        }
//    }
//}
