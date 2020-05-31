//
//  GuestCoreDataModel+CoreDataProperties.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//
//

import Foundation
import CoreData


extension GuestCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GuestCoreDataModel> {
        return NSFetchRequest<GuestCoreDataModel>(entityName: "GuestCoreDataModel")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var bookingsString: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: Int64
    @NSManaged public var imageUrl: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: String?

}
