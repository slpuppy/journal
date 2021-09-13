//
//  Entrys+CoreDataProperties.swift
//  journal
//
//  Created by Paulo Tadashi Tokikawa on 13/09/21.
//
//

import Foundation
import CoreData


extension Entrys {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entrys> {
        return NSFetchRequest<Entrys>(entityName: "Entrys")
    }

    @NSManaged public var afterMood: Int16
    @NSManaged public var date: Date?
    @NSManaged public var mood: Int16
    @NSManaged public var texts: NSSet?

    public var textArray: [EntrysTexts] {
        let set = texts as? Set<EntrysTexts> ?? []
        
        return set.sorted {
            $0.order < $1.order
        }
    }
    
    
}

// MARK: Generated accessors for texts
extension Entrys {

    @objc(addTextsObject:)
    @NSManaged public func addToTexts(_ value: EntrysTexts)

    @objc(removeTextsObject:)
    @NSManaged public func removeFromTexts(_ value: EntrysTexts)

    @objc(addTexts:)
    @NSManaged public func addToTexts(_ values: NSSet)

    @objc(removeTexts:)
    @NSManaged public func removeFromTexts(_ values: NSSet)

}

extension Entrys : Identifiable {

}
