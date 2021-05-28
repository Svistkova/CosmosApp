//
//  SceneDelegate.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 26.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let windowScene:UIWindowScene = scene as! UIWindowScene;
        self.window = UIWindow(windowScene: windowScene)
        let firstViewController = RootViewController(nibName: "RootViewController", bundle : nil)
        window?.rootViewController = UINavigationController(rootViewController: firstViewController)
        self.window!.makeKeyAndVisible()

        guard let _ = (scene as? UIWindowScene) else { return }
    }


}

