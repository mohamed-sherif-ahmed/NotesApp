//
//  Note.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 4/13/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import Foundation
import CoreData

class Note: NSManagedObject {
    
    func getAllNotes() {
        let context = AppDelegate.viewContext
        let req: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            let notes = try context.fetch(req)
            NotificationCenter.default.post(name: .notesNotification, object: nil, userInfo: ["notes":notes])
        } catch {
            print("Error Fetching NotesVC")
        }
    }
    
    func addNote() {
        
    }
}
