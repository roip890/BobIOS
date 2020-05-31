//
//  WishElement.swift
//  BobIOS
//
//  Created by Roi Peretz on 24/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WishElementDomainModel: Codable, Equatable, Identifiable {
    
    init() {}
    
    public var id: Int = -1
    
    var key: String?
    var value: String?
    var type: String?
    var order: Int?
    
}
