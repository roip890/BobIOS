//
//  SceneDelegate.swift
//  CountriesSwiftUI
//
//  Created by Aptenobytes on 23.10.2019.
//  Copyright © 2019 Aptenobytes. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var archiveTimer: Timer?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            #if targetEnvironment(macCatalyst)
            windowScene.titlebar?.titleVisibility = .hidden
            #endif
                        
            let controller = UIHostingController(rootView: ContentView())
            
            window.rootViewController = controller
            self.window = window
            window.makeKeyAndVisible()
            
//            archiveTimer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true, block: { _ in
//                store.state.archiveState()
//            })
            
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
//        store.state.archiveState()
    }
}
