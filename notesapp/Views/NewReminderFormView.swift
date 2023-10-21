//
//  NewReminderFormView.swift
//  notesapp
//
//  Created by Clement Skosana on 2023/10/21.
//

import SwiftUI

struct NewReminderFormView: View {
    
    @StateObject var newReminderFormViewModel: NewReminderFormViewModel = NewReminderFormViewModel()
    
    @Binding var showNewReminderSheet: Bool
    @FocusState private var istitleFieldIsFocused: Bool //TODO: figure out how we can have this initialized earlier.
    
    var body: some View {
        NavigationStack{
            Form{
                newReminderDetailSection
                NavigationLink(value: "string") {
                    Text("Details")
                        .font(.title3)
                }
                listSection
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                istitleFieldIsFocused = true
            })
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        //TODO: pop the sheet and clear the form.
                        showNewReminderSheet.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {}, label: {
                        Text("Add")
                    })
                    .disabled(!newReminderFormViewModel.canAddReminder)
                }
            }
        }
    }
}

private extension NewReminderFormView {
    var newReminderDetailSection: some View {
        Section{
            TextField(text: $newReminderFormViewModel.newReminderTitleText) {
                Text("Title")
            }
            .focused($istitleFieldIsFocused)
            TextEditor(text: $newReminderFormViewModel.newReminderNotesText)
                .frame(height: 60)
        }
    }
    
    var listSection: some View {
        Section {
            NavigationLink(value: "string"){
                HStack(spacing: 10) {
                    Circle()
                        .fill(Color.orange)
                        .frame(height: 30)
                        .overlay{
                            Image(systemName: "list.bullet")
                                .foregroundColor(.white)
                        }
                    Text("List")
                        .font(.title3)
                    Spacer()
                    Text("Reminders")
                }
            }
        }
    }
}

#Preview {
    NewReminderFormView(showNewReminderSheet: .constant(false))
}
