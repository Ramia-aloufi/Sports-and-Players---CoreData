//
//  Player+CoreDataProperties.swift
//  Sports and Players
//
//  Created by R on 25/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Double
    @NSManaged public var height: Double
    @NSManaged public var id: UUID?
    @NSManaged public var playerToSport: Sport?

}
