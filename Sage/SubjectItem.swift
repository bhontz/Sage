//
//  SubjectItem.swift
//  Sage
//
//  Created by brad.hontz on 3/12/20.
//  Copyright © 2020 brad.hontz. All rights reserved.
//

import Foundation
import CoreData

public class SubjectItem:NSManagedObject, Identifiable {
    @NSManaged public var subject:String?
    @NSManaged public var daysOfWeek:String?
    @NSManaged public var duration: Int16
}

extension SubjectItem {
    static func getAllSubjectItems()-> NSFetchRequest<SubjectItem> {
        let request:NSFetchRequest<SubjectItem> = SubjectItem.fetchRequest() as! NSFetchRequest<SubjectItem>
        let sortDescriptor = NSSortDescriptor(key: "subject", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
