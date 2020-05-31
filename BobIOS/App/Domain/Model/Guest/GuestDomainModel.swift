//
//  Guest.swift
//  BobIOS
//
//  Created by Roi Peretz on 24/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import SwiftyJSON

// yyyy-MM-dd HH:mm:ss.SSS
// E MMM dd HH:mm:ss z yyyy
public struct GuestDomainModel: Codable, Equatable, Identifiable {
    
    init() {}
    
    public var id: Int = -1
    var email: String?
    var password: String?
    var lastName: String?
    var firstName: String?
    var birthday:Date?
    var image:String?
    var phone:String?
    var bookings: [Int]?
    var hotelId: Int?
    
}
