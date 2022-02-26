//
//  SceneDelegate.swift
//  MyDocApp
//
//  Created by Kaz Yoshikawa on 2/26/22.
//

import UIKit

class SceneDelegate: UIResponder, UISceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		if let scene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: scene)
			let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! DocumentBrowserViewController
			window.rootViewController = viewController
			self.window = window
			window.makeKeyAndVisible()
		}
	}
	
	func sceneDidDisconnect(_ scene: UIScene) {
	}

}
