//
//  ContainerViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 4/12/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var mainViewController: UIViewController?
    var sideNavigationController: SideNavigationViewController?
    var navigationState: NavigationState = .collapsed {
        didSet{
            if navigationState != .collapsed {
                mainViewController?.view.layer.shadowOpacity = 0.8
            } else {
                mainViewController?.view.layer.shadowOpacity = 0.0
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rootVC = FoldersViewController()
        rootVC.navigationDrawerDelegate = self
        mainViewController = UINavigationController(rootViewController: rootVC)
        view.addSubview(mainViewController!.view)
        addChild(mainViewController!)
    }
}

extension ContainerViewController: CenterViewDelegate{
    func toogleDrawer() {
        if navigationState == .collapsed {
            navigationState = .expanded
            sideNavigationController = SideNavigationViewController()
            sideNavigationController!.view.frame = CGRect(x: 0, y: 0, width: view.frame.width - 120, height: view.frame.height)
            view.insertSubview(sideNavigationController!.view, at: 0)
            addChild(sideNavigationController!)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,  animations: {
                self.mainViewController?.view.frame = CGRect(x: self.view.frame.width - 120, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            })
        } else {
            navigationState = .collapsed
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,  animations: {
                self.mainViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            }) { s in
                self.sideNavigationController!.view.removeFromSuperview()
                self.sideNavigationController = nil
            }
        }
    }
}

enum NavigationState{
    case collapsed
    case expanded
}
