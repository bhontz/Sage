//
//  ToDoItemView.swift
//  SAGEb
//
//  Created by brad.hontz on 3/11/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//
// SEE: https://youtu.be/-BZdQmHV4MQ  for the ToDoList implementation!!!

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "a title", createdAt: "date here")
    }
}
