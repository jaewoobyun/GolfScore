//
//  Course+CoreDataProperties.swift
//  
//
//  Created by JaewooByun on 2021/04/23.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var name: String?

}
