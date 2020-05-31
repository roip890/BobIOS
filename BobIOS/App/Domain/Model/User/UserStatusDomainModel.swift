//
//  UserStatus.swift
//  BobIOS
//
//  Created by Roi Peretz on 24/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public enum UserStatusDomainModel: String, Codable, Equatable {
    case active = "active"
    case inactive = "inactive"
    case unknown

    public init(from decoder: Decoder) throws {
        guard let rawValue = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = UserStatusDomainModel(rawValue: rawValue) ?? .unknown
    }
}
