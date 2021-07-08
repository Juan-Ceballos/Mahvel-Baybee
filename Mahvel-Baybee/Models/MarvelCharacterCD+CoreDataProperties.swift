//
//  MarvelCharacterCD+CoreDataProperties.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 7/8/21.
//
//

import Foundation
import CoreData


extension MarvelCharacterCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MarvelCharacterCD> {
        return NSFetchRequest<MarvelCharacterCD>(entityName: "MarvelCharacterCD")
    }

    @NSManaged public var cacheDate: Date?
    @NSManaged public var cacheExpDate: Date?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var img: String?
    @NSManaged public var name: String?

}

extension MarvelCharacterCD : Identifiable {

}
