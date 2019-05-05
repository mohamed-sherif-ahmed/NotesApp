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
        tv.textColor = .black
        tv.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        tv.delegate = self
        return tv
    }()
    
    lazy var noteText: UITextView = {
        let tv = UITextView()
        tv.textColor = .black
        tv.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        tv.delegate = self
        return tv
    }()

    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = note?.title ?? "New Note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNote))
        navigationItem.largeTitleDisplayMode = .never
        prepareView()
    }
    
    func prepareView() {
        view.backgroundColor = .white
        if let _ = note {
            noteText.text = note?.text
            noteTitle.text = note?.title
        } else {
            noteText.text = "Note Text"
            noteTitle.text = "New Note"
            noteText.textColor = .gray
            noteTitle.textColor = .gray
        }
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
    
    @objc func saveNote() {
        let context = AppDelegate.viewContext
        if note == nil {
            let note = Note(context: context)
            note.title = noteTitle.text
            note.text = noteText.text
        } else {
            note?.text = noteText.text
            note?.title = noteTitle.text
        }
        do {
            try context.save()
        } catch {
            print("")
        }
    }
}

extension NoteEditViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView == noteTitle {
            navigationItem.title = textView.text
        }
    }
    
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
                textView.text = "New Note"
            } else {
                textView.text = "Note Text"
            }
        }
    }
}
