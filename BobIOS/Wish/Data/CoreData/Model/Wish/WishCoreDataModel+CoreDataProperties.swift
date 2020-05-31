//
//  WishCoreDataModel+CoreDataProperties.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//
//

import Foundation
import CoreData


extension WishCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WishCoreDataModel> {
        return NSFetchRequest<WishCoreDataModel>(entityName: "WishCoreDataModel")
    }

    @NSManaged public var bookingId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var imageUrl: String?
    @NSManaged public var insertTs: Date?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var lmTs: Date?
    @NSManaged public var status: String?
    @NSManaged public var title: String?
    @NSManaged public var departments: NSSet?
    @NSManaged public var elements: NSSet?
    @NSManaged public var guest: GuestCoreDataModel?
    @NSManaged public var user: UserCoreDataModel?

}

// MARK: Generated accessors for departments
extension WishCoreDataModel {

    @objc(addDepartmentsObject:)
    @NSManaged public func addToDepartments(_ value: DepartmentCoreDataModel)

    @objc(removeDepartmentsObject:)
    @NSManaged public func removeFromDepartments(_ value: DepartmentCoreDataModel)

    @objc(addDepartments:)
    @NSManaged public func addToDepartments(_ values: NSSet)

    @objc(removeDepartments:)
    @NSManaged public func removeFromDepartments(_ values: NSSet)

}

// MARK: Generated accessors for elements
extension WishCoreDataModel {

    @objc(addElementsObject:)
    @NSManaged public func addToElements(_ value: WishElementCoreDataModel)

    @objc(removeElementsObject:)
    @NSManaged public func removeFromElements(_ value: WishElementCoreDataModel)

    @objc(addElements:)
    @NSManaged public func addToElements(_ values: NSSet)

    @objc(removeElements:)
    @NSManaged public func removeFromElements(_ values: NSSet)

}
