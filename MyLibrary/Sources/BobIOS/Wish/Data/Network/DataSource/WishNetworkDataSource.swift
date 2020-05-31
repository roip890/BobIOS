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
    
    let provider = MoyaProvider<WishNetworkRestAPI>(plugins: [NetworkLoggerPlugin(
        configuration: NetworkLoggerPlugin.Configuration(
            logOptions: .verbose
    ))])
    
    var cancelBag = CancelBag()
    

    func getWishes() -> AnyPublisher<[WishDomainModel], Error> {
        
//        AF.request("http://159.65.87.128:8081/WishManagement/services/wishes/getPage?index=0&limit=20",
//        method: .get,
//        encoding: URLEncoding.httpBody,
//        headers: [:])
//            .responseJSON { res in
//                print(res)
//        }
        
//        provider.request(.wishes(index: 0, limit: 20)) { res in
//            print(res)
//        }
                
        return provider.requestPublisher(.wishes(index: 0, limit: 20), callbackQueue: DispatchQueue(label: "network"))
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
