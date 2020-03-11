//
//  ToDoView.swift
//  SAGEb
//
//  Created by brad.hontz on 3/11/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//
// SEE: https://youtu.be/-BZdQmHV4MQ  for the ToDoList implementation!!!

import SwiftUI

struct ToDoView: View {
    @EnvironmentObject var settings: UserSettings
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems: FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView {
            ZStack() {
                VStack {
                    Image("To-Do Header").resizable().frame(width:220, height:60)
                    List {
                        Section(header: Text("What's next?")) {
                            HStack {
                                TextField("New Item", text: self.$newToDoItem)
                                Button(action: {
                                    let toDoItem = ToDoItem(context: self.managedObjectContext)
                                    toDoItem.title = self.newToDoItem
                                    toDoItem.createdAt = Date()
                                    
                                    do {
                                        try self.managedObjectContext.save()
                                    } catch {
                                        print(error)
                                    }
                                    self.newToDoItem = ""
                                    
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        .imageScale(.large)
                                }
                            }
                        }.font(.headline) // end first section
                        
                        Section(header: Text("To-Dos")) {
                            ForEach(self.toDoItems) { td in
                                ToDoItemView(title: td.title!, createdAt: self.getFormattedDate(date: td.createdAt!, format: "MMM d, h:mm a"))
                            }.onDelete { indexSet in
                                let deleteItem = self.toDoItems[indexSet.first!]
                                self.managedObjectContext.delete(deleteItem)

                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    print(error)
                                }
                            }
                        } // end second section
                    } // end List section
                    
                    Spacer()
                    NavigationLink(destination: HomeView()
                        .navigationBarTitle("")  // for some reason you need a title (ANY title) in order to hide the navigation bar
                        .navigationBarHidden(true)
                    ){
                        Image("Back Button").renderingMode(.original).resizable().padding(.leading, 30.0).padding(.top, 10.0).frame(width: 140, height: 60)
                    }

                    }.navigationBarItems(trailing: EditButton()).navigationBarTitle("").navigationBarHidden(true) // end VStack
                
                Image("To-Do Plant 1").resizable().frame(width:360, height: 110)

            }  // end ZStack

        } // end NavigationView
    }
    // here's how we convert Date variables to formatted strings
    func getFormattedDate(date: Date, format: String) -> String {
            let dateformat = DateFormatter()
            dateformat.dateFormat = format
            return dateformat.string(from: date)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
