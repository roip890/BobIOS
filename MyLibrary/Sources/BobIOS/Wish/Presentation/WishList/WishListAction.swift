//
//  WishListAction.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

enum WishListAction {
    case getWishesAction(index: Int, limit: Int)
    case setTextAction(text: String)
}
