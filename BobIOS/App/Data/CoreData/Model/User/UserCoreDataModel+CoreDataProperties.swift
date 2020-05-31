//
//  UserCoreDataModel+CoreDataProperties.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//
//

import Foundation
import CoreData


extension UserCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCoreDataModel> {
        return NSFetchRequest<UserCoreDataModel>(entityName: "UserCoreDataModel")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var hotelId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var imageUrl: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var permissionLevel: String?
    @NSManaged public var phone: String?
    @NSManaged public var status: String?
    @NSManaged public var departments: NSSet?

}

// MARK: Generated accessors for departments
extension UserCoreDataModel {

    @objc(addDepartmentsObject:)
    @NSManaged public func addToDepartments(_ value: DepartmentCoreDataModel)

    @objc(removeDepartmentsObject:)
    @NSManaged public func removeFromDepartments(_ value: DepartmentCoreDataModel)

    @objc(addDepartments:)
    @NSManaged public func addToDepartments(_ values: NSSet)

    @objc(removeDepartments:)
    @NSManaged public func removeFromDepartments(_ values: NSSet)

}
