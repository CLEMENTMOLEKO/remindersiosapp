//
//  NotesCategoryView.swift
//  notesapp
//
//  Created by Clement Skosana on 2023/10/15.
//

import SwiftUI

struct NotesCategoryView: View {
    let noteCategory: NotesCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Circle()
                    .fill(noteCategory.categoryColor)
                    .frame(height: 30)
                    .overlay{
                        Image(systemName: noteCategory.systemImageName)
                            .foregroundColor(.white)
                    }
                Spacer()
                Text("\(noteCategory.notes.count)")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.primary)
            }
            Text("\(noteCategory.categoryName)")
                .font(.title3)
                .fontWeight(.semibold)
        }
        .padding(.leading, 10)
        .padding(.trailing, 15)
        .padding(.vertical, 10)
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(15)
    }
}

#Preview {
    NotesCategoryView(noteCategory: Data.notesCategories.first!)
}
