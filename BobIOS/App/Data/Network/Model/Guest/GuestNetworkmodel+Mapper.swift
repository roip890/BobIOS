//
//  GuestNetworkmodel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension GuestNetworkModel {

    func toDomainModel() -> GuestDomainModel {
        
        var guestDomainModel: GuestDomainModel = GuestDomainModel()
        
        guestDomainModel.id = self.id
        
        guestDomainModel.firstName = self.firstName
        guestDomainModel.lastName = self.lastName
        guestDomainModel.email = self.email
        guestDomainModel.phone = self.phone

        guestDomainModel.password = self.password

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        guestDomainModel.birthday = (self.birthday != nil) ? formatter.date(from: self.birthday!) : nil

        guestDomainModel.image = self.image

        return guestDomainModel
    }
    
}

extension GuestDomainModel {

    func toNetworkModel() -> GuestNetworkModel {
        
        var guestNetworkModel: GuestNetworkModel = GuestNetworkModel()
        
        guestNetworkModel.id = self.id
        
        guestNetworkModel.firstName = self.firstName
        guestNetworkModel.lastName = self.lastName
        guestNetworkModel.email = self.email
        guestNetworkModel.phone = self.phone
        
        guestNetworkModel.password = self.password

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        guestNetworkModel.birthday = (self.birthday != nil) ? formatter.string(from: self.birthday!) : nil
        
        guestNetworkModel.image = self.image

        return guestNetworkModel

    }
    
}
