//
//  WishListViewModel.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import Combine
import Resolver

class WishListViewModel: ObservableObject {
    
    @Injected var wishRepository: WishRepository
    
    var intents: PassthroughSubject<WishListIntent, Never> = PassthroughSubject<WishListIntent, Never>()

    @Published var state: WishListState = WishListState()
    
    var cancelBag: CancelBag = CancelBag()
    
    init() {
        intents
        .flatMap { intent in self.intentToAction(intent: intent) }
        .flatMap{ action in self.proccessResult(action: action) }
        .sink { result in
            self.state = self.reduceResultToState(result: result, state: self.state)
        }
        .store(in: cancelBag)
        
    }
    
    func intentToAction(intent: WishListIntent) -> AnyPublisher<WishListAction, Never> {
        switch intent {
        case let .getWishesIntent(index, limit):
            return Just(WishListAction.getWishesAction(index: index, limit: limit))
            .eraseToAnyPublisher()
        case let .setTextIntent(text):
            return Just(WishListAction.setTextAction(text: text))
            .eraseToAnyPublisher()
        }
    }
        
    func proccessResult(action: WishListAction) -> AnyPublisher<WishListResult, Never> {
        switch action {
        case let .getWishesAction(index, limit):
            return Future<WishListResult, Never> { promise in
                self.wishRepository.getWishes()
                    .sinkToResult({ result in
                        switch(result) {
                        case let .failure(error):
                            promise(.success(.getWishesResult(.error(error: error))))
                        case let .success(wishes):
                            promise(.success(.getWishesResult(.success(wishes: wishes))))
                        }
                })
            }
            .prepend(.getWishesResult(.loading))
            .eraseToAnyPublisher()
        case let .setTextAction(text):
            return Future<WishListResult, Never> { promise in
                promise(.success(.setTextResult(.success(text: text))))
            }
            .prepend(.setTextResult(.loading))
            .eraseToAnyPublisher()
        }
    }
    
    func reduceResultToState(result: WishListResult, state: WishListState) -> WishListState {
        switch result {
        case .setTextResult(.loading):
            state.text = "Loading..."
        case let .setTextResult(.success(text)):
            state.text = text
        default:
            break
        }
        return state
    }
}
