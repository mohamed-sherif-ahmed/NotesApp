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
        tableView.reloadData()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    let settingStrings = ["Folders", "Todo", "Notes", "Settings"]
    let cellIdentifier = "settingCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach {$0.isActive = true}
    }
}

extension SideNavigationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        cell.textLabel?.text = settingStrings[indexPath.item]
        return cell
    }
}

extension SideNavigationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
