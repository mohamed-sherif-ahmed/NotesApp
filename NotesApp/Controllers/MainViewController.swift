//
//  MainViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/10/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    //MARK: IBOutlets
    @IBOutlet weak var foldersCollectionView: UICollectionView!
    
    //MARK: Variables
    let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tabToDismiss(_:)))
    var navigationView: UINavigationView?
    
    //MARK: Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        foldersCollectionView.register(FolderCollectionViewCell.self, forCellWithReuseIdentifier: "folderCell")
//        view.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(handlePanGesture(_:))))
    }
    
    //MARK: IBActions
    @IBAction func openSideNavigationView(_ sender: Any) {
        openSide()
    }
    
    func openSide() {
        navigationView = UINavigationView()
        
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
        view.addGestureRecognizer(tabGesture)
        view.isUserInteractionEnabled = true
        view.addSubview(navigationView!)
    
    }
    
    func dismissNavSideBar() {
        print("REMOVING !")
        for v in view.subviews {
            if v is UINavigationView {
                v.removeFromSuperview()
            }
        }
        view.removeGestureRecognizer(tabGesture)
    }
    
    @objc func tabToDismiss(_ sender: UITapGestureRecognizer){
        dismissNavSideBar()
    }
    
    @objc func specFunc(_ sender: UIGestureRecognizer){
        print("OPA A7")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,  animations: {
            let sideNavViewWidth = self.view.bounds.width * (3/4)
            self.navigationView?.frame = CGRect(x: -1 * sideNavViewWidth, y: 0, width: sideNavViewWidth, height: self.view.frame.height)
        }){ (Bool) in
            self.dismissNavSideBar()
            }
    }
}

//MARK: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "folderCell", for: indexPath) as! FolderCollectionViewCell
        cell.lblFolderName.text = "Test"
        return cell
    }
}

//MARK: FlowLayoutDelegate
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 10) / 2
        return CGSize(width: size, height: size)
    }
}

//MARK: GestureRecognizerDelegate
//extension MainViewController: UIGestureRecognizerDelegate {
//
//    @objc func handlePanGesture (_ recognizer: UIPanGestureRecognizer) {
////        let dirIsRight = recognizer.velocity(in: view).x < 0
//        switch recognizer.state {
//        case .ended:
//            openSide()
//        default:
//            break
//        }
//    }
//}
