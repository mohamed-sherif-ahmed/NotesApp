//
//  FoldersViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/20/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class FoldersViewController: BaseViewController {
    
    lazy var foldersCollectionView:UICollectionView = {
        let fcv = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        fcv.register(FolderCollectionViewCell.self, forCellWithReuseIdentifier: "folderCell")
        fcv.backgroundColor = .white
        fcv.dataSource = self
        fcv.delegate = self
        return fcv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Folders"
        view.addSubview(foldersCollectionView)
//        foldersCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        [foldersCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//        foldersCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//        foldersCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//        foldersCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach{$0.isActive = true}
    }
}

    
    //MARK: UICollectionViewDataSource
    extension FoldersViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "folderCell", for: indexPath) as! FolderCollectionViewCell
            cell.lblFolderName.text = "Test"
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            print("OpAaA \(indexPath.item)")
            let vc = NoteEditViewController()
            vc.noteName = "Note #\(indexPath.item)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: FlowLayoutDelegate
    extension FoldersViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = (collectionView.frame.width - 10) / 2
            return CGSize(width: size, height: size)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
