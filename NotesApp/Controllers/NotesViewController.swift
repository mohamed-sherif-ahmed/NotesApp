//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/18/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    
    let context = AppDelegate.viewContext
    var notes = [Note]()

    lazy var notesTableView: UITableView = {
        let nCV = UITableView()
        nCV.register(FolderCollectionViewCell.self, forCellReuseIdentifier: "noteCell")
        nCV.delegate = self
        nCV.dataSource = self
        nCV.backgroundColor = UIColor(white: 1, alpha: 0)
        nCV.separatorStyle = .none
        return nCV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(notesTableView)
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 241/255, alpha: 1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Notes"
        notesTableView.translatesAutoresizingMaskIntoConstraints = false
        [notesTableView.topAnchor.constraint(equalTo: view.topAnchor),
        notesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        notesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        notesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach {$0.isActive = true}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let req: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            notes = try context.fetch(req)
        } catch {
            print("Error Fetching NotesVC")
        }
        notesTableView.reloadData()
    }
    
    func addItem() {
        navigationController?.pushViewController(NoteEditViewController(), animated: true)
    }
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! FolderCollectionViewCell
        let n = notes[indexPath.item]
        cell.folderName.text = n.title
        return cell
    }
}

extension NotesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NoteEditViewController()
        vc.note = notes[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}

////MARK: FlowLayoutDelegate
//extension NotesViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = (collectionView.frame.width - 20)
//        return CGSize(width: size, height: 75)
//    }
//}
