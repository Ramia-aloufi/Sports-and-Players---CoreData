//
//  Sport+CoreDataProperties.swift
//  Sports and Players
//
//  Created by R on 25/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//
//

import Foundation
import CoreData


extension Sport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sport> {
        return NSFetchRequest<Sport>(entityName: "Sport")
    }

    @NSManaged public var name: String?
    @NSManaged public var photo: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var sportToPlayer: NSSet?

}

// MARK: Generated accessors for sportToPlayer
extension Sport {

    @objc(addSportToPlayerObject:)
    @NSManaged public func addToSportToPlayer(_ value: Player)

    @objc(removeSportToPlayerObject:)
    @NSManaged public func removeFromSportToPlayer(_ value: Player)

    @objc(addSportToPlayer:)
    @NSManaged public func addToSportToPlayer(_ values: NSSet)

    @objc(removeSportToPlayer:)
    @NSManaged public func removeFromSportToPlayer(_ values: NSSet)

}
