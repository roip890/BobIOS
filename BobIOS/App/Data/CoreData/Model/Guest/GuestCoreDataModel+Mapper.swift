//
//  GuestCoreDataModel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension GuestCoreDataModel {

    func toDomainModel() -> GuestDomainModel {
        
        var guestDomainModel: GuestDomainModel = GuestDomainModel()
        
        guestDomainModel.id = Int(self.id)
        
        guestDomainModel.firstName = self.firstName
        guestDomainModel.lastName = self.lastName
        guestDomainModel.email = self.email
        guestDomainModel.phone = self.phone
        guestDomainModel.image = self.imageUrl
        guestDomainModel.birthday = self.birthday

        return guestDomainModel
    }
    
}

extension GuestDomainModel {

    func toCoreDataModel() -> GuestCoreDataModel {
        
        let guestCoreDataModel: GuestCoreDataModel = GuestCoreDataModel()
        
        guestCoreDataModel.id = Int64(self.id)
        
        guestCoreDataModel.firstName = self.firstName
        guestCoreDataModel.lastName = self.lastName
        guestCoreDataModel.email = self.email
        guestCoreDataModel.phone = self.phone
        guestCoreDataModel.imageUrl = self.image
        guestCoreDataModel.birthday = self.birthday

        return guestCoreDataModel

    }
    
}
