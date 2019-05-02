//
//  TodosViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/20/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.frame
        tableView.allowsMultipleSelection = true
        tableView.register(TodoItemTableViewCell.self, forCellReuseIdentifier: "todoCell")
        return tableView
    }()
    
    var todos: [TodoItem] = []
    let context = AppDelegate.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageButton = UIButton(type: .custom)
        imageButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageButton.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        imageButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        
        let rightItem = UIBarButtonItem(customView: imageButton)
        [rightItem.customView?.widthAnchor.constraint(equalToConstant: 25),
         rightItem.customView?.heightAnchor.constraint(equalToConstant: 25)].forEach {$0?.isActive = true}
        navigationItem.rightBarButtonItem = rightItem
        view.addSubview(tableView)
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler(longPressGesture:))))
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach{$0.isActive = true}
        
    }
    
    @objc func longPressHandler(longPressGesture: UILongPressGestureRecognizer) {
        if longPressGesture.state == .began {
            let tp = longPressGesture.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: tp) {
                let cell = tableView.cellForRow(at: indexPath) as! TodoItemTableViewCell
                cell.todoTitle.isEnabled = true
                cell.todoTitle.becomeFirstResponder()
            }
        }
    }
    
    @objc func addItem() {
        //TODO: implement addTodo :D
        let ti = TodoItem(context: todos[0].managedObjectContext!)
        ti.itemDone = false
        ti.itemTitle = "add new Item"
        ti.listName = todos[0].listName
        do {
            try context.save()
        } catch {
            print("neb2a neshuf 7al")
        }
        todos.append(ti)
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: todos.count - 1, section: 0), at: .bottom, animated: true)

        let cell = tableView.cellForRow(at: IndexPath(row: todos.count - 1, section: 0)) as! TodoItemTableViewCell
        cell.todoTitle.isEnabled = true
    }
}

extension TodosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoItemTableViewCell
        let data = todos[indexPath.item]
        if data.itemDone == true {
            cell.textLabel?.attributedText = NSAttributedString(string: data.itemTitle!, attributes: cell.checkedAttributes)
        } else {
            cell.textLabel?.attributedText = NSAttributedString(string: data.itemTitle!, attributes: cell.uncheckedAttributes)
            cell.imgCheck.image = cell.applyImageInsets(to: #imageLiteral(resourceName: "onCheck"))
        }
        return cell
    }
}

extension TodosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if todos[indexPath.item].itemDone == true {
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
    }
}
