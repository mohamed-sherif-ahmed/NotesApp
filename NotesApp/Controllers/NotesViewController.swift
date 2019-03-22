//
//  NotesViewController.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 3/18/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import UIKit

class NotesViewController: MainViewController {

    @IBOutlet weak var notesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notes"
        notesCollectionView.register(FolderCollectionViewCell.self, forCellWithReuseIdentifier: "noteCell")
        // Do any additional setup after loading the view.
    }
}

extension NotesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteCell", for: indexPath) as! FolderCollectionViewCell
        cell.lblFolderName.text = "Note \(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = NoteEditViewController()
        vc.noteName = "Note #\(indexPath.item)"
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: FlowLayoutDelegate
extension NotesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 10) / 2
        return CGSize(width: size, height: size)
    }
}
