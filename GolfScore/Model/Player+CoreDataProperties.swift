//
//  Player+CoreDataProperties.swift
//  
//
//  Created by JaewooByun on 2021/04/23.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var rounds: Round?

}
