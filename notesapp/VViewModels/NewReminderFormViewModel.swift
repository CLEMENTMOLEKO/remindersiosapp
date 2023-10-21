//
//  NewReminderFormViewModel.swift
//  notesapp
//
//  Created by Clement Skosana on 2023/10/21.
//

import Foundation

class NewReminderFormViewModel: ObservableObject {
    @Published var newReminderTitleText: String = ""
    @Published var newReminderNotesText: String = ""

    //MARK: Computed properties
    var canAddReminder: Bool {
        !self.newReminderNotesText.isEmpty && !self.newReminderTitleText.isEmpty
    }
}
