//
//  HomeView.swift
//  notesapp
//
//  Created by Clement Skosana on 2023/10/15.
//

import SwiftUI

struct HomeView: View {
    @State var isKeyBoardVisible: Bool = false
    @State var searchFieldText: String = ""
    @State var showNewReminderSheet: Bool = false
    
    //TODO: Remove this to a view model and the above
    @State var newReminderTitleText: String = ""
    @State var newReminderNotesText: String = ""
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
//                TextField(text: $searchFieldText) {
//                    HStack{
//                        Image(systemName: "magnifyingglass")
//                        Text("Search")
//                    }
//                    .frame(height: 50)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.gray)
//                    .border(Color.black)
//                }
                LazyVStack(spacing: 15) {
                    notesViews
                        .padding(.top, 10)
                    myListsSection
                }
                .sheet(isPresented: $showNewReminderSheet, content: {
                   NewReminderFormView(showNewReminderSheet: $showNewReminderSheet)
                })
               
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(value: "Decimal.self") {
                        Menu {
                            Label("Edit Lists", systemImage: "pencil")
                            Label("Templates", systemImage: "square.on.square")
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }

                    }
                }
            }
            .searchable(text: $searchFieldText)
            .safeAreaInset(edge: .bottom, content: {
                if !isKeyBoardVisible {
                    AddButtons
                }
            })
            .navigationDestination(for: NotesCategory.self) { notesCategory in
                //TODO: create a notes detail view.
                Text("\(notesCategory.categoryName)")
            }
            .onReceive(keyboardPublisher) { value in
                //TODO: figure out how to animate this better.
                isKeyBoardVisible = value
            }
        }
    }
}

//MARK: COMPONENTS
private extension HomeView {
    var notesViews: some View {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: .infinity * 0.5, maximum: .infinity), spacing: 15),
            GridItem(.adaptive(minimum: .infinity * 0.5, maximum: .infinity), spacing: 15),
        ], spacing: 15){
            ForEach(Data.notesCategories) { notesCategory in
                NavigationLink(value: notesCategory) {
                    NotesCategoryView(noteCategory: notesCategory)
                }
                .foregroundColor(.secondary)
            }
        }
    }
    
    var myListsSection: some View {
        //TODO: maybe this should be a container...
        Section(header: 
                    Text("My Lists")
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        ) {
            NavigationLink(value: "String") {
                HStack(spacing: 15) {
                    Circle()
                        .fill(Color.orange)
                        .frame(height: 30)
                        .overlay{
                            Image(systemName: "list.bullet")
                                .foregroundColor(.white)
                        }
                    Text("Reminders")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("\(Data.notes.count)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(15)
            }
        }
    }
    
    private var AddButtons: some View {
        HStack {
            Button(action: {
                showNewReminderSheet.toggle()
            }, label: {
                Label {
                    Text("New Reminder")
                        .font(.headline)
                } icon: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }

            })
            Spacer()
            Button("Add List") {
                //TODO: show shee to add list
            }
            .font(.headline)
        }
        .padding(.horizontal, 30)
    }
}

//MARK: PREVIEW
#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
