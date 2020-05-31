//
//  WishNetworkDataSource.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import Moya
import Combine
import Alamofire

public struct WishNetworkDataSource: WishWebDataSource {
    
//    let provider = MoyaProvider<WishNetworkRestAPI>(plugins: [NetworkLoggerPlugin(
//        configuration: NetworkLoggerPlugin.Configuration(
//            logOptions: .verbose
//    ))])
  
    let provider = MoyaProvider<WishNetworkRestAPI>()

    var cancelBag = CancelBag()
    

    func getWishes() -> AnyPublisher<[WishDomainModel], Error> {
        return provider.requestPublisher(.wishes(index: 0, limit: 20))
            .map(GetWishesNetworkResponseWrapper.self, using: JSONDecoder())
        .compactMap { response in
            print("res")
            return response.response?.wishes?.map({$0.toDomainModel()})
        }
        .mapError{ moyaError in
            print("err")
            return moyaError
        }
        .eraseToAnyPublisher()
    }
}
