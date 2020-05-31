//
//  WishElementNetworkModel+Mapper.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

extension WishElementNetworkModel {

    func toDomainModel() -> WishElementDomainModel {
        
        var wishElementDomainModel: WishElementDomainModel = WishElementDomainModel()
        
        wishElementDomainModel.id = self.id
        
        wishElementDomainModel.value = self.value
        wishElementDomainModel.key = self.key
        wishElementDomainModel.order = self.order
        wishElementDomainModel.type = self.type
        
        return wishElementDomainModel
    }
    
}

extension WishElementDomainModel {

    func toNetworkModel() -> WishElementNetworkModel {
        
        var wishElementNetworkModel: WishElementNetworkModel = WishElementNetworkModel()
        
        wishElementNetworkModel.id = self.id
        
        wishElementNetworkModel.value = self.value
        wishElementNetworkModel.key = self.key
        wishElementNetworkModel.order = self.order
        wishElementNetworkModel.type = self.type

        return wishElementNetworkModel

    }
    
}
