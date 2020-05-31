//
//  WishCoreDataModel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension WishCoreDataModel {

    func toDomainModel() -> WishDomainModel {
        
        var wishDomainModel: WishDomainModel = WishDomainModel()
        
        wishDomainModel.id = Int(self.id)
        
        wishDomainModel.bookingId = Int(self.bookingId)

        wishDomainModel.insertTs = self.insertTs
        wishDomainModel.lmTs = self.lmTs

        wishDomainModel.title = self.title
        wishDomainModel.status = WishStatusDomainModel(rawValue: self.status ?? "")
        
        wishDomainModel.imageUrl = self.imageUrl
        wishDomainModel.isFavorite = self.isFavorite

        wishDomainModel.departments = (self.departments ?? NSSet())
        .toArray(of: DepartmentCoreDataModel.self)
            .compactMap { $0.toDomainModel() }
        
        wishDomainModel.elements = (self.elements ?? NSSet())
        .toArray(of: WishElementCoreDataModel.self)
        .compactMap { $0.toDomainModel() }

        wishDomainModel.user = self.user?.toDomainModel()
        
        return wishDomainModel
    }
    
}

extension WishDomainModel {

    func toCoreDataModel() -> WishCoreDataModel {
        
        let wishCoreDataModel: WishCoreDataModel = WishCoreDataModel()
        
        wishCoreDataModel.id = Int64(self.id)
        
        wishCoreDataModel.bookingId = Int64(self.bookingId ?? -1)

        wishCoreDataModel.insertTs = self.insertTs
        wishCoreDataModel.lmTs = self.lmTs

        wishCoreDataModel.title = self.title
        wishCoreDataModel.status = self.status?.rawValue
        
        wishCoreDataModel.imageUrl = self.imageUrl
        wishCoreDataModel.isFavorite = self.isFavorite ?? false

        wishCoreDataModel.departments = NSSet(array: self.departments?.compactMap {$0.toCoreDataModel()} ?? [])
        
        wishCoreDataModel.elements = NSSet(array: self.elements?.compactMap {$0.toCoreDataModel()} ?? [])
        
        wishCoreDataModel.user = self.user?.toCoreDataModel()
        
        return wishCoreDataModel

    }
    
}
