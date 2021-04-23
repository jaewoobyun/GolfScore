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
    @NSManaged public var hole1: Int16?
    @NSManaged public var hole2: Int16?
    @NSManaged public var hole3: Int16?
    @NSManaged public var hole4: Int16?
    @NSManaged public var hole5: Int16?
    @NSManaged public var hole6: Int16?
    @NSManaged public var hole7: Int16?
    @NSManaged public var hole8: Int16?
    @NSManaged public var hole9: Int16?
    @NSManaged public var hole10: Int16?
    @NSManaged public var hole11: Int16?
    @NSManaged public var hole12: Int16?
    @NSManaged public var hole13: Int16?
    @NSManaged public var hole14: Int16?
    @NSManaged public var hole15: Int16?
    @NSManaged public var hole16: Int16?
    @NSManaged public var hole17: Int16?
    @NSManaged public var hole18: Int16?
    
}
