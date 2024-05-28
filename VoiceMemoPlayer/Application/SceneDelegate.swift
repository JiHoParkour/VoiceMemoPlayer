//
//  SceneDelegate.swift
//  VoiceMemoPlayer
//
//  Created by jiho park on 5/28/24.
//

import UIKit

import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var launchRouter: LaunchRouting?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .systemBackground
        self.window = window
        
        let result = AppRootBuilder(dependency: AppComponent()).build()
        self.launchRouter = result
        launchRouter?.launch(from: window)
    }
}

