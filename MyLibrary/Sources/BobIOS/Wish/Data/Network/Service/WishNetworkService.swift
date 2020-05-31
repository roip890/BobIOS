//
//  WishNetworkService.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import Moya
import Combine
import CombineMoya

public enum WishNetworkRestAPI : TargetType {
    
    // end points
    case wishes(index: Int, limit: Int)

    public var baseURL: URL {
        return URL(string: "http://159.65.87.128:8081/WishManagement/services/wishes")!
    }
    
    public var path: String {
        switch self {
        case .wishes:
            return "/getPage"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .wishes:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .wishes:
            return Data()
        }
    }
    
    public var task: Task {
        switch self {
        case let .wishes(index, limit):
            return .requestParameters(parameters: [
                "index": index,
                "limit": limit
            ], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .wishes:
            return ["Content-Type" : "application/json"]
        }
    }
}
