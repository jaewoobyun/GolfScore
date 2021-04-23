//
//  Round+CoreDataProperties.swift
//  
//
//  Created by JaewooByun on 2021/04/23.
//
//

import Foundation
import CoreData


extension Round {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Round> {
        return NSFetchRequest<Round>(entityName: "Round")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var course: Course?
    @NSManaged public var players: NSSet?

}

// MARK: Generated accessors for players
extension Round {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: Player)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: Player)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}
