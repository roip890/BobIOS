//
//  WishElementNetworkModel.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public struct WishElementNetworkModel: Codable, Equatable, Identifiable {
    
    init() {}
    
    public var id: Int = -1
    
    var key: String?
    var value: String?
    var type: String?
    var order: Int?

    private enum CodingKeys: String, CodingKey{
        case id = "id"

        case key = "key"
        case value = "value"
        case type = "type"
        case order = "order"
    }

    public func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        
        try container.encode(self.key, forKey: .key)
        try container.encode(self.value, forKey: .value)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.order, forKey: .order)
    }
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
                
        self.id = try container.decode(Int.self, forKey: .id)
        
        self.key = try container.decode(String.self, forKey: .key)
        self.value = try container.decode(String.self, forKey: .value)
        self.type = try container.decode(String.self, forKey: .type)
        self.order = try container.decode(Int.self, forKey: .order)
    }

}
