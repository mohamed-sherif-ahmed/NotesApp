//
//  SideNavigationViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 4/12/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class SideNavigationViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.isScrollEnabled = false
        tableView.backgroundColor = UIColor(red: 62/255, green: 87/255, blue: 228/255, alpha: 1.0)
        return tableView
    }()
    
    var navigationDelegate: CenterNavigationDelegate?
    
    let settingStrings = ["Todo", "Notes"]
    let cellIdentifier = "settingCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach {$0.isActive = true}
    }
}

extension SideNavigationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        cell.textLabel?.text = settingStrings[indexPath.item]
        cell.backgroundColor = UIColor(white: 1, alpha: 0)
        return cell
    }
}

extension SideNavigationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            navigationDelegate?.segue(to: TodolistsCollectionViewController())
        case 1:
            navigationDelegate?.segue(to: NotesViewController())
        default:
            print("ERR")
        }
    }
}
