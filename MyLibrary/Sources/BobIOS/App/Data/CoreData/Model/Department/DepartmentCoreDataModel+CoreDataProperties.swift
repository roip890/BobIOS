//
//  DepartmentCoreDataModel+CoreDataProperties.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//
//

import Foundation
import CoreData


extension DepartmentCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DepartmentCoreDataModel> {
        return NSFetchRequest<DepartmentCoreDataModel>(entityName: "DepartmentCoreDataModel")
    }

    @NSManaged public var name: String?

}
