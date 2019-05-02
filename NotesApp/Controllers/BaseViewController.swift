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
        
        let imageButton = UIButton(type: .custom)
        imageButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageButton.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        imageButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        
        let rightItem = UIBarButtonItem(customView: imageButton)
        [rightItem.customView?.widthAnchor.constraint(equalToConstant: 25),
         rightItem.customView?.heightAnchor.constraint(equalToConstant: 25)].forEach {$0?.isActive = true}
        navigationItem.rightBarButtonItem = rightItem
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func addItem() {
        fatalError("addItem hasnot been implemented !")
    }
    
    @objc func openSide() {
        navigationDrawerDelegate?.toogleDrawer() {}
    }
}
