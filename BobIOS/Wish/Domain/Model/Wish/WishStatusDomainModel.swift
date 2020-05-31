//
//  WishStatus.swift
//  BobIOS
//
//  Created by Roi Peretz on 24/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

public enum WishStatusDomainModel: String, Codable, Equatable {
    case waiting = "active"
    case pending = "inactive"
    case inProgress = "in_progress"
    case done = "done"
    case unknown

    public init(from decoder: Decoder) throws {
        guard let rawValue = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = WishStatusDomainModel(rawValue: rawValue) ?? .unknown
    }
}
