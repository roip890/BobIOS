//
//  UserNetworkModel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension UserNetworkModel {

    func toDomainModel() -> UserDomainModel {
        
        var userDomainModel: UserDomainModel = UserDomainModel()
        
        userDomainModel.id = self.id
        
        userDomainModel.firstName = self.firstName
        userDomainModel.lastName = self.lastName
        userDomainModel.email = self.email
        userDomainModel.phone = self.phone

        userDomainModel.password = self.password

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        userDomainModel.birthday = (self.birthday != nil) ? formatter.date(from: self.birthday!) : nil

        userDomainModel.image = self.image

        userDomainModel.status = UserStatusDomainModel(rawValue: self.status ?? "")

        userDomainModel.departments = self.departments?.compactMap {
            var departmentDomainModel: DepartmentDomainModel = DepartmentDomainModel()
            departmentDomainModel.name = $0
            return departmentDomainModel
        } ?? []
                
        userDomainModel.permissionLevel = self.permissionLevel

        userDomainModel.hotelId = self.hotelId

        return userDomainModel
    }
    
}

extension UserDomainModel {

    func toNetworkModel() -> UserNetworkModel {
        
        var userNetworkModel: UserNetworkModel = UserNetworkModel()
        
        userNetworkModel.id = self.id
        
        userNetworkModel.firstName = self.firstName
        userNetworkModel.lastName = self.lastName
        userNetworkModel.email = self.email
        userNetworkModel.phone = self.phone
        
        userNetworkModel.password = self.password

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        userNetworkModel.birthday = (self.birthday != nil) ? formatter.string(from: self.birthday!) : nil
        
        userNetworkModel.image = self.image

        userNetworkModel.status = self.status?.rawValue

        userNetworkModel.departments = self.departments?.compactMap {$0.name} ?? []
                
        userNetworkModel.permissionLevel = self.permissionLevel

        userNetworkModel.hotelId = self.hotelId
        
        return userNetworkModel

    }
    
}
