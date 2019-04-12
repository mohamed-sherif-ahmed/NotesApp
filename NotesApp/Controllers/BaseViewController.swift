//
//  MainViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/10/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController{
    //MARK: Variables
    public var navigationDrawerDelegate: CenterViewDelegate?
    
    //MARK: Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openSide))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addDummyNote))
    }
    
    @objc func addDummyNote() {
        let context = AppDelegate.viewContext
        let note = Note(context: context)
        note.text = "Core Data Test!!"
        note.title = "Core Data Title!!"
        do {
            try context.save()
        } catch {
            print("ERR!! SAVING CONTEXT MainVC")
        }
    }
    
    @objc func openSide() {
        navigationDrawerDelegate?.toogleDrawer()
    }
}
