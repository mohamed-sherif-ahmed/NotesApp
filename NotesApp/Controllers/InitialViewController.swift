//
//  InitialViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 5/2/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class InitialViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let notesVC = UINavigationController(rootViewController: NotesViewController())
        let todosVC = UINavigationController(rootViewController: TodolistsCollectionViewController())
        
        let notesImage = #imageLiteral(resourceName: "notepad").withRenderingMode(.automatic).withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        let todosImage = #imageLiteral(resourceName: "list").withRenderingMode(.automatic).withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        notesVC.tabBarItem = UITabBarItem(title: nil, image: notesImage, tag: 0)
        todosVC.tabBarItem = UITabBarItem(title: nil, image: todosImage, tag: 1)
        
        viewControllers = [notesVC, todosVC]
        
        tabBar.barTintColor = UIColor(red: 186/255, green: 172/255, blue: 186/255, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
}
