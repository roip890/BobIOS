//
//  WishNetworkModel.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public struct WishNetworkModel: Codable, Equatable, Identifiable {
    
    init() {}
    
    public var id: Int = -1
    
    var title: String?
    var isFavorite: Bool?
    var status: String?

    var insertTs: String?
    var lmTs: String?
    
    var imageUrl: String?
    
    var elements: [WishElementNetworkModel]?
    
    var departments: [String]?
    
    var bookingId: Int?

    var user: UserNetworkModel?
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"

        case title = "title"
        case isFavorite = "isFavorite"
        case status = "status"
        
        case insertTs = "insertTs"
        case lmTs = "lmTs"

        case imageUrl = "imageUrl"
        
        case elements = "elements"
                
        case departments = "departments"
        
        case bookingId = "bookingId"

        case user = "user"
    }

    public func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        
        try container.encode(self.title, forKey: .title)
        try container.encode(self.isFavorite, forKey: .isFavorite)
        try container.encode(self.status, forKey: .status)
        
        try container.encode(self.insertTs, forKey: .insertTs)
        try container.encode(self.lmTs, forKey: .lmTs)

        try container.encode(self.imageUrl, forKey: .imageUrl)
        
        try container.encode(self.elements, forKey: .elements)
        
        try container.encode(self.departments, forKey: .departments)
        
        try container.encode(self.bookingId, forKey: .bookingId)
        
        try container.encode(self.user, forKey: .user)
    }
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
                
        self.id = try container.decode(Int.self, forKey: .id)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        self.status = try container.decode(String.self, forKey: .status)
        
        self.insertTs = try container.decode(String.self, forKey: .insertTs)
        self.lmTs = try container.decode(String.self, forKey: .lmTs)

        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)

        self.elements = try container.decode([WishElementNetworkModel].self, forKey: .elements)

        self.departments = try container.decode([String].self, forKey: .departments)

        self.bookingId = try container.decode(Int.self, forKey: .bookingId)
        
        self.user = try container.decode(UserNetworkModel.self, forKey: .user)
    }

}
