//
//  WishListResult.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

enum WishListResult {
    case getWishesResult(GetWishesResult)
    case setTextResult(SetTextResult)

    enum GetWishesResult {
        case loading
        case success(wishes: [WishDomainModel])
        case error(error: Error)
    }

    enum SetTextResult {
        case loading
        case success(text: String)
        case error(error: Error)
    }
}
