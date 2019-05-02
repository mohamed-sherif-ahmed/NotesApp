//
//  TodolistsCollectionViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 4/26/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "todoCell"

class TodolistsCollectionViewController: BaseViewController{
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        cv.register(FolderCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let context = AppDelegate.viewContext
    var todoLists = Array<TodoList>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach{$0.isActive = true}
        
        let req: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        do {
            todoLists = try context.fetch(req)
        } catch {
            print("Error Fetching NotesVC")
        }
        
        collectionView.reloadData()
    }
    
    override func addItem() {
        print("Hannnnn2aaad !")
        let tl = TodoList(context: context)
        tl.listTitle = "Testtt"
        let todo1 = TodoItem(context: tl.managedObjectContext!)
        todo1.itemDone = false
        todo1.itemTitle = "1 todo"
        tl.addToItems(todo1)
        do {
            try context.save()
        } catch {
            print("neb2a neshuf 7al")
        }
        collectionView.reloadData()
    }
}

extension TodolistsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todoLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FolderCollectionViewCell
        cell.folderName.text = todoLists[indexPath.item].listTitle
        return cell
    }
}

extension TodolistsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TodosViewController()
        vc.todos = todoLists[indexPath.item].items?.allObjects as! [TodoItem]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TodolistsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 20)
        return CGSize(width: size, height: 75)
    }
}
