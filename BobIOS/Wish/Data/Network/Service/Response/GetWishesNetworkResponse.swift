//
//  GetWishesNetworkResponse.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public struct GetWishesNetworkResponse: Codable {
    
    init() {}
        
    var statusResponse: StatusResponseNetworkModel?
    var wishes: [WishNetworkModel]?

    private enum CodingKeys: String, CodingKey{
        case statusResponse = "statusResponse"
        case wishes = "requests"
    }

    public func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(self.statusResponse, forKey: .statusResponse)
        try? container.encode(self.wishes, forKey: .wishes)
    }
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statusResponse = try? container.decode(StatusResponseNetworkModel.self, forKey: .statusResponse)
        self.wishes = try? container.decode([WishNetworkModel].self, forKey: .wishes)
    }

}

public struct GetWishesNetworkResponseWrapper: Codable {
    
    init() {}
        
    var response: GetWishesNetworkResponse?

    private enum CodingKeys: String, CodingKey{
        case response = "response"
    }

    public func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(self.response, forKey: .response)
    }
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try? container.decode(GetWishesNetworkResponse.self, forKey: .response)
    }

}
