//
//  FoodItem+CoreDataProperties.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/12/03.
//
//

import Foundation
import CoreData


extension FoodItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodItem> {
        return NSFetchRequest<FoodItem>(entityName: "FoodItem")
    }
    @NSManaged public var id: NSNumber!
    @NSManaged public var foodInfo: String!
    @NSManaged public var foodImage: Data!
    @NSManaged public var dateCreated: Date!
    @NSManaged public var dateDeleted: Date!

}

extension FoodItem : Identifiable {

}
