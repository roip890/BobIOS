//
//  GuestNetworkModel.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public struct GuestNetworkModel: Codable, Equatable, Identifiable {
    
    init() {}
    
    public var id: Int = -1

    var firstName: String?
    var lastName: String?
    var email: String?
    var phone:String?

    var password: String?

    var birthday:String?

    var image:String?
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"

        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case phone = "phone"
        
        case password = "password"
        
        case birthday = "bday"
        
        case image = "image"
    }

    public func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(self.id, forKey: .id)
        
        try? container.encode(self.firstName, forKey: .firstName)
        try? container.encode(self.lastName, forKey: .lastName)
        try? container.encode(self.email, forKey: .email)
        try? container.encode(self.phone, forKey: .phone)
        
        try? container.encode(self.password, forKey: .password)
        
        try? container.encode(self.birthday, forKey: .birthday)
        
        try? container.encode(self.image, forKey: .image)
        
    }
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
                
        self.id = try container.decode(Int.self, forKey: .id)
        
        self.firstName = try? container.decode(String.self, forKey: .firstName)
        self.lastName = try? container.decode(String.self, forKey: .lastName)
        self.email = try? container.decode(String.self, forKey: .email)
        self.phone = try? container.decode(String.self, forKey: .phone)
        
        self.password = try? container.decode(String.self, forKey: .password)
        
        self.birthday = try? container.decode(String.self, forKey: .birthday)
        
        self.image = try? container.decode(String.self, forKey: .image)
    }

}
