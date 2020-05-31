//
//  Wish.swift
//  BobIOS
//
//  Created by Roi Peretz on 24/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public struct WishDomainModel: Codable, Equatable, Identifiable {

    init() {}
    
    public var id: Int = -1
    
    var bookingId: Int?
    var insertTs: Date?
    var lmTs: Date?
    var title: String?
    var status: WishStatusDomainModel?
    var imageUrl: String?
    var isFavorite: Bool?
    var elements: [WishElementDomainModel]?
    var departments: [DepartmentDomainModel]?
    var user: UserDomainModel?

}
