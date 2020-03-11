//
//  ToDoItem.swift
//  SAGEb
//
//  Created by brad.hontz on 3/11/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//
// SEE: https://youtu.be/-BZdQmHV4MQ  for the ToDoList implementation!!!

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems()-> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
