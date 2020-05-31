//
//  DepartmentDomainModel.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

struct DepartmentDomainModel: Codable, Equatable, Identifiable {
    
    init() {}
    
    public var id: Int = -1
    var name: String?
    
}
