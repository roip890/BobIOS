//
//  WishNetworkModel+mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension WishNetworkModel {

    func toDomainModel() -> WishDomainModel {
        
        var wishDomainModel: WishDomainModel = WishDomainModel()
        
        wishDomainModel.id = self.id
        
        wishDomainModel.title = self.title
        wishDomainModel.isFavorite = self.isFavorite
        wishDomainModel.status = WishStatusDomainModel(rawValue: self.status ?? "")


        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

        wishDomainModel.insertTs = (self.insertTs != nil) ? formatter.date(from: self.insertTs!) : nil
        wishDomainModel.lmTs = (self.lmTs != nil) ? formatter.date(from: self.lmTs!) : nil
        
        wishDomainModel.imageUrl = self.imageUrl

        wishDomainModel.departments = self.departments?.compactMap {
            var departmentDomainModel: DepartmentDomainModel = DepartmentDomainModel()
            departmentDomainModel.name = $0
            return departmentDomainModel
        } ?? []
        
        wishDomainModel.elements = self.elements?.compactMap {$0.toDomainModel()} ?? []

        wishDomainModel.bookingId = self.bookingId
        
        wishDomainModel.user = self.user?.toDomainModel()
        
        return wishDomainModel
    }
    
}

extension WishDomainModel {

    func toNetworkModel() -> WishNetworkModel {
        
        var wishNetworkModel: WishNetworkModel = WishNetworkModel()
        
        wishNetworkModel.id = self.id
        
        wishNetworkModel.title = self.title
        wishNetworkModel.isFavorite = self.isFavorite ?? false
        wishNetworkModel.status = self.status?.rawValue

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

        wishNetworkModel.insertTs = (self.insertTs != nil) ? formatter.string(from: self.insertTs!) : nil
        wishNetworkModel.lmTs = (self.lmTs != nil) ? formatter.string(from: self.lmTs!) : nil

        
        wishNetworkModel.imageUrl = self.imageUrl

        wishNetworkModel.departments = self.departments?.compactMap {$0.name} ?? []
        
        wishNetworkModel.elements = self.elements?.compactMap {$0.toNetworkModel()} ?? []
        
        wishNetworkModel.bookingId = self.bookingId

        wishNetworkModel.user = self.user?.toNetworkModel()
        
        return wishNetworkModel

    }
    
}
