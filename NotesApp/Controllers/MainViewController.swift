//
//  MainViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/10/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    //MARK: Variables
//    let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tabToDismiss(_:)))
    var navigationView: UINavigationView?
    
    //MARK: Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = "Folders"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openSide))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: nil)
    }
    
    @objc func openSide() {
        navigationView = UINavigationView()
        navigationView?.navigationController = self as NavigationControllerProtocol
        let sideNavViewWidth = view.bounds.width * (3/4)
        let startPos = CGRect(x: -1 * sideNavViewWidth, y: 0, width: sideNavViewWidth, height: view.frame.height)
        navigationView?.frame = startPos
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,  animations: {
            self.navigationView?.frame = CGRect(x: 0, y: 0, width: sideNavViewWidth, height: self.view.frame.height)
        })
        navigationView?.frame.size.width = view.bounds.width * (3/4)
        let gr = UISwipeGestureRecognizer(target: self, action: #selector(specFunc(_:)))
        gr.direction = .left
        navigationView?.addGestureRecognizer(gr)
        navigationView!.isUserInteractionEnabled = true
//        view.addGestureRecognizer(tabGesture)
//        view.isUserInteractionEnabled = true
        view.addSubview(navigationView!)
    
    }
    
    func dismissNavSideBar() {
        for v in view.subviews {
            if v is UINavigationView {
                v.removeFromSuperview()
            }
        }
//        view.removeGestureRecognizer(tabGesture)
    }
    
    @objc func tabToDismiss(_ sender: UITapGestureRecognizer){
        dismissNavSideBar()
    }
    
    @objc func specFunc(_ sender: UIGestureRecognizer){
        animateNavBarDisappearance() {}
    }
    
    func animateNavBarDisappearance(callback: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,  animations: {
            let sideNavViewWidth = self.view.bounds.width * (3/4)
            self.navigationView?.frame = CGRect(x: -1 * sideNavViewWidth, y: 0, width: sideNavViewWidth, height: self.view.frame.height)
        }){ (Bool) in
            self.dismissNavSideBar()
            callback()
        }
    }
}

extension MainViewController: NavigationControllerProtocol {
    func goToFolders() {
        animateNavBarDisappearance {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            self.navigationController?.pushViewController(sb.instantiateViewController(withIdentifier: "foldersVC"), animated: true)
        }
    }
    
    func goToSettings() {
        animateNavBarDisappearance {
            print("Hanro7 lel 2e3dadat isa")
        }
    }
    
    func goToNotes() {
        animateNavBarDisappearance() {
            self.navigationController?.pushViewController(NotesViewController(), animated: true)
        }
    }
}
