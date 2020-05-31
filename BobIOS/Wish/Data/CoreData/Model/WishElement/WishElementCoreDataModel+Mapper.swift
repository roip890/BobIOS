//
//  WishElementCoreDataModel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension WishElementCoreDataModel {

    func toDomainModel() -> WishElementDomainModel {
        
        var wishElementDomainModel: WishElementDomainModel = WishElementDomainModel()
        
        wishElementDomainModel.id = Int(self.id)
        
        wishElementDomainModel.value = self.value
        wishElementDomainModel.key = self.key
        wishElementDomainModel.order = Int(self.order)
        wishElementDomainModel.type = self.type
        
        return wishElementDomainModel
    }
    
}

extension WishElementDomainModel {

    func toCoreDataModel() -> WishElementCoreDataModel {
        
        let wishElementCoreDataModel: WishElementCoreDataModel = WishElementCoreDataModel()
        
        wishElementCoreDataModel.id = Int64(self.id)
        
        wishElementCoreDataModel.value = self.value
        wishElementCoreDataModel.key = self.key
        wishElementCoreDataModel.order = Int64(self.order ?? -1)
        wishElementCoreDataModel.type = self.type

        return wishElementCoreDataModel

    }
    
}
