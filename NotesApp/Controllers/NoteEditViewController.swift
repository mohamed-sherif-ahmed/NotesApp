//
//  NoteEditViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/22/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class NoteEditViewController: UIViewController {
    lazy var noteText: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .lightGray
        return tv
    }()
    
    lazy var noteTitle: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = UIColor.blue
        return tv
    }()
    
    var noteName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = noteName!
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: nil)
        prepareView()
    }
    
    func prepareView() {
        view.backgroundColor = .white
        view.addSubview(noteText)
        view.addSubview(noteTitle)
        noteTitle.translatesAutoresizingMaskIntoConstraints = false
        noteText.translatesAutoresizingMaskIntoConstraints = false
        [noteTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         noteTitle.heightAnchor.constraint(equalToConstant: 75),
         noteTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         noteTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         noteText.topAnchor.constraint(equalTo: noteTitle.bottomAnchor),
         noteText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         noteText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         noteText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)].forEach { $0.isActive = true}
    }
}
