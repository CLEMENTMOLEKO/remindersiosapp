//
//  NotesCategory.swift
//  notesapp
//
//  Created by Clement Skosana on 2023/10/15.
//

import Foundation
import SwiftUI

struct NotesCategory: Hashable, Identifiable {
    let id = UUID()
    let systemImageName: String
    let categoryName: String
    let notes: [Note]
    let categoryColor: Color
}
