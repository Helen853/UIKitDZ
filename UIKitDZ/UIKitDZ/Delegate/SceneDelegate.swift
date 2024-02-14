// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Scene
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let catalogVC = СatalogViewController()
        let bascetVC = BasketViewController()
        let profileVC = ProfileViewController()

        let window = UIWindow(windowScene: windowScene)
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([catalogVC, bascetVC, profileVC], animated: true)
        window.rootViewController = tabBarVC
        self.window = window
        window.makeKeyAndVisible()
    }
}
