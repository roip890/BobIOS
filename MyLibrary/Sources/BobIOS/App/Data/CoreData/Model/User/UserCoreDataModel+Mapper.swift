//
//  UserCoreDataModel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension UserCoreDataModel {

    func toDomainModel() -> UserDomainModel {
        
        var userDomainModel: UserDomainModel = UserDomainModel()
        
        userDomainModel.id = Int(self.id)
        
        userDomainModel.firstName = self.firstName
        userDomainModel.lastName = self.lastName
        userDomainModel.email = self.email
        userDomainModel.phone = self.phone
        
        userDomainModel.image = self.imageUrl
        
        userDomainModel.birthday = self.birthday

        userDomainModel.status = UserStatusDomainModel(rawValue: self.status ?? "")
        
        userDomainModel.departments = (self.departments ?? NSSet())
        .toArray(of: DepartmentCoreDataModel.self)
            .compactMap { $0.toDomainModel() }
                
        return userDomainModel
    }
    
}

extension UserDomainModel {

    func toCoreDataModel() -> UserCoreDataModel {
        
        let userCoreDataModel: UserCoreDataModel = UserCoreDataModel()
        
        userCoreDataModel.id = Int64(self.id)
                
        userCoreDataModel.firstName = self.firstName
        userCoreDataModel.lastName = self.lastName
        userCoreDataModel.email = self.email
        userCoreDataModel.phone = self.phone
        
        userCoreDataModel.imageUrl = self.image
        
        userCoreDataModel.birthday = self.birthday

        userCoreDataModel.status = self.status?.rawValue

        userCoreDataModel.departments = NSSet(array: self.departments?.compactMap {$0.toCoreDataModel()} ?? [])
                
        return userCoreDataModel

    }
    
}
