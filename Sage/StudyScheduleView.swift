//
//  StudyScheduleSetupView.swift
//  Sage
//
//  Created by brad.hontz on 3/12/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//
// fillColors list comes from: https://htmlcolorcodes.com
//

var fillColors: [Int32] = [0xC0C0C0, 0x808080, 0xFF0000, 0x800000, 0xFFFF00, 0x00FF00, 0x00FFFF, 0xFF00FF, 0x800080, 0x0000FF]
var itemCounter: Int = 0  // keeps track of where we're at in this array

import SwiftUI

struct StudyScheduleView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: SubjectItem.getAllSubjectItems()) var subjectItems: FetchedResults<SubjectItem>
    @State private var showModal = false
    @State private var newSubjectItem = ""
    
    var body: some View {
        VStack {
            Text("Subject View")
            List {
                Section(header: Text("Add Subject")) {
                    HStack {
                        TextField("New Subject", text: self.$newSubjectItem)
                        Button(action: {
                            let subjectItem = SubjectItem(context: self.managedObjectContext)
                            subjectItem.subject = self.newSubjectItem
                            subjectItem.daysOfWeek = "S M T W T F S"
                            subjectItem.duration = 0
                            subjectItem.hexColor = fillColors[itemCounter]
                            itemCounter = itemCounter > 9 ? 0 : itemCounter + 1 // colors wrap around
                            
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            self.newSubjectItem = ""
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    } // end HStack
                }
                
                Section(header: Text("Subjects")) {
                    ForEach(self.subjectItems) { sub in
                        NavigationLink(destination: StudySubjectDetailView(subItem: sub)) {
                            SubjectItemView(subject: sub.subject, daysOfWeek: sub.daysOfWeek, duration: sub.duration, hexColor: sub.hexColor)
                        }
                    }
                    .onDelete { indexSet in
                        let deleteItem = self.subjectItems[indexSet.first!]
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
            ) {
                Text("Back Home")
            }
        } // end VStack
    }
}

//struct StudyScheduleView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudyScheduleView()
//    }
//}
