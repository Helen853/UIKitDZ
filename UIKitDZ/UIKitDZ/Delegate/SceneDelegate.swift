// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        configureRootViewController(windowScene)
    }

    func configureRootViewController(_ windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MainTabBarController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
