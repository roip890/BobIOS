//
//  DepartmentCoreDataModel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension DepartmentCoreDataModel {

    func toDomainModel() -> DepartmentDomainModel {
        
        var departmentDomainModel: DepartmentDomainModel = DepartmentDomainModel()
        
        departmentDomainModel.name = self.name
        
        return departmentDomainModel
    }
    
}

extension DepartmentDomainModel {

    func toCoreDataModel() -> DepartmentCoreDataModel {
        
        let departmentCoreDataModel: DepartmentCoreDataModel = DepartmentCoreDataModel()
        
        departmentCoreDataModel.name = self.name

        return departmentCoreDataModel

    }
    
}
