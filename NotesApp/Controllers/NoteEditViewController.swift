//
//  NoteEditViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/22/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class NoteEditViewController: UIViewController {
    lazy var noteTitle: UITextView = {
        let tv = UITextView()
        tv.text = "Note Title !"
        tv.textColor = .gray
        tv.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        tv.delegate = self
        return tv
    }()
    
    lazy var noteText: UITextView = {
        let tv = UITextView()
        tv.text = "Note Body !"
        tv.textColor = .gray
        tv.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        tv.delegate = self
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

extension NoteEditViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == nil || textView.text == "" {
            textView.textColor = .gray
            if textView == noteTitle {
                textView.text = "Note Title !"
            } else {
                textView.text = "Note Body !"
            }
        }
    }
}
