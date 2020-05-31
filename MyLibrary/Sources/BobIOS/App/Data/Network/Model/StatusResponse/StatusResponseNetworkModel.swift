//
//  StatusResponse.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public struct StatusResponseNetworkModel: Codable, Equatable {
    
    init() {}
        
    var code: Int?
    var message: String?
    var status: String?

    private enum CodingKeys: String, CodingKey{
        case code = "code"
        case message = "msg"
        case status = "status"
    }

    public func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.status, forKey: .status)
    }
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int.self, forKey: .code)
        self.message = try container.decode(String.self, forKey: .message)
        self.status = try container.decode(String.self, forKey: .status)
    }

}
