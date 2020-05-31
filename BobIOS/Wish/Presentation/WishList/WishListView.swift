//
//  WishListView.swift
//  BobIOS
//
//  Created by Roi Peretz on 28/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import SwiftUI
import Combine

struct WishListView: View {
    
    @EnvironmentObject var viewModel: WishListViewModel
    
    var body: some View {
        VStack {
            Text(self.viewModel.state.text)
            Button(action: {self.viewModel.intents.send(.setTextIntent(text: "New String!"))}, label: { Text("Change Text") })
        }
    }

}

#if DEBUG
struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
#endif
