//
//  data.swift
//  notesapp
//
//  Created by Clement Skosana on 2023/10/15.
//

import Foundation
import SwiftUI

struct Data {
    static let notesCategories: [NotesCategory] = [
        NotesCategory(systemImageName: "calendar", categoryName: "Today", notes: Self.notes, categoryColor: Color.blue),
        NotesCategory(systemImageName: "calendar", categoryName: "Scheduled", notes: Self.notes, categoryColor: Color.red),
        NotesCategory(systemImageName: "rectangle.stack.badge.plus", categoryName: "All", notes: Self.notes, categoryColor: Color.green),
        NotesCategory(systemImageName: "flag", categoryName: "Flagged", notes: Self.notes, categoryColor: Color.orange),
        NotesCategory(systemImageName: "checkmark", categoryName: "Completed", notes: Self.notes, categoryColor: Color.gray)
    ]
    
    static let notes: [Note] = [
        Note(name: "Reminder1", title: "This is reminder", body: "Lorem ipsum dolo set amet")
    ]
}
