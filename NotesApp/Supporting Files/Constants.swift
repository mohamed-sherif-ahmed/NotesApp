//
//  Constants.swift
//  NotesApp
//
//  Created by Mohamed Sherif on 4/12/19.
//  Copyright © 2019 Mohamed Sherif. All rights reserved.
//

import Foundation

enum Constants: Int {
    case remainingWidth = 120
}


extension Notification.Name {
    static let notesNotification = Notification.Name("notes")
    static let todoNotification = Notification.Name("todo")
}
