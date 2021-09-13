//
//  EntrysTexts+CoreDataProperties.swift
//  journal
//
//  Created by Paulo Tadashi Tokikawa on 13/09/21.
//
//

import Foundation
import CoreData


extension EntrysTexts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntrysTexts> {
        return NSFetchRequest<EntrysTexts>(entityName: "EntrysTexts")
    }

    @NSManaged public var order: Int16
    @NSManaged public var text: String?
    @NSManaged public var entry: Entrys?
}

extension EntrysTexts : Identifiable {

}
