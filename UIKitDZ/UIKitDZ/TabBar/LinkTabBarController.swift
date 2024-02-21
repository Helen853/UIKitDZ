// LinkTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class LinkTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.itemPositioning = .centered
        generateTabBar()
        setTabBarAppearance()
    }

    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: PhotoFeedViewController(),
                title: AppConstants.photoFeedTabBarTitle,
                image: UIImage(named: AppConstants.photoFeedTabBarImage)
            ),

            generateVC(
                viewController: NotificationsViewController(),
                title: AppConstants.notificationsTabBarTitle,
                image: UIImage(named: AppConstants.notificationsTabBarImage)
            ),

            generateVC(
                viewController: ProfileViewController(),
                title: AppConstants.profileTabBarTitle,
                image: UIImage(named: AppConstants.profileTabBarImage)
            )
        ]
    }

    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }

    private func setTabBarAppearance() {
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1)
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = .white
    }
}
