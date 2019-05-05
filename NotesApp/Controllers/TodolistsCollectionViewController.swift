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

class TodolistsCollectionViewController: UIViewController{
    
    lazy var todoListTableView: UITableView = {
        let cv = UITableView()
        cv.register(FolderCollectionViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.separatorStyle = .none
        cv.backgroundColor = UIColor(white: 1, alpha: 0)
        return cv
    }()
    
    let context = AppDelegate.viewContext
    var todoLists = Array<TodoList>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 241/255, alpha: 1.0)
        view.addSubview(todoListTableView)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Todos"
        
        todoListTableView.translatesAutoresizingMaskIntoConstraints = false
        [todoListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        todoListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        todoListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        todoListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach{$0.isActive = true}
        
        let req: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        do {
            todoLists = try context.fetch(req)
        } catch {
            print("Error Fetching NotesVC")
        }
        
        todoListTableView.reloadData()
    }
    
    func addItem() {
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
        todoListTableView.reloadData()
    }
}

extension TodolistsCollectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FolderCollectionViewCell
        cell.folderName.text = todoLists[indexPath.item].listTitle
        return cell
    }
}

extension TodolistsCollectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TodosViewController()
        vc.todos = todoLists[indexPath.item].items?.allObjects as! [TodoItem]
        navigationController?.pushViewController(vc, animated: true)
    }
}
