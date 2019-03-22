//
//  NoteEditViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/22/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class NoteEditViewController: UIViewController {
    let editView = UITextView()
    var noteName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = noteName!
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: nil)
        prepareView()
    }
    
    func prepareView() {
        view.backgroundColor = .yellow
        editView.frame = CGRect(x: view.bounds.minX, y: view.bounds.minY, width: view.frame.width, height: view.frame.height)
        view.addSubview(editView)
//        view = UIView()
//        view.addSubview(editView)
//        let contstrains = [
//            NSLayoutConstraint(item: editView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 5),
//            NSLayoutConstraint(item: editView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 5),
//            NSLayoutConstraint(item: editView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 5),
//            NSLayoutConstraint(item: editView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 5)
//        ]
//        editView.addConstraints(contstrains)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
