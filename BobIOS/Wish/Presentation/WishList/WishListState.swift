//
//  WishListState.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

class WishListState: Equatable {
    var wishes: [WishDomainModel] = []
    var text: String = "Test Text"
}

func == (lhs: WishListState, rhs: WishListState) -> Bool {
    return lhs.wishes == rhs.wishes &&
        lhs.text == rhs.text
}

#if DEBUG
extension WishListState {
    static var preview: WishListState {
        let state = WishListState()
        return state
    }
}
#endif
