//
//  WishElementCoreDataModel+CoreDataProperties.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//
//

import Foundation
import CoreData


extension WishElementCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WishElementCoreDataModel> {
        return NSFetchRequest<WishElementCoreDataModel>(entityName: "WishElementCoreDataModel")
    }

    @NSManaged public var id: Int64
    @NSManaged public var key: String?
    @NSManaged public var order: Int64
    @NSManaged public var type: String?
    @NSManaged public var value: String?

}
