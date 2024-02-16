// MarketplaceTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class MarketplaceTabBarController: UITabBarController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.itemPositioning = .centered
        generateTabBar()
        setTabBarAppearance()
    }

    // MARK: - Private Method

    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: СatalogViewController(),
                title: "Каталог",
                image: UIImage(named: "catalogEmpty"),
                selectedImage: UIImage(named: "catalogFull")
            ),
            generateVC(
                viewController: BasketViewController(),
                title: "Корзина",
                image: UIImage(named: "basketEmpty"),
                selectedImage: UIImage(named: "basketFull")
            ),
            generateVC(
                viewController: ProfileViewController(),
                title: "Профиль",
                image: UIImage(named: "profileEmpty"),
                selectedImage: UIImage(named: "profileFull")
            )
        ]
    }

    private func generateVC(
        viewController: UIViewController,
        title: String,
        image: UIImage?,
        selectedImage: UIImage?
    ) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.selectedImage = selectedImage
        return navigationController
    }

    private func setTabBarAppearance() {
        tabBar.tintColor = UIColor(named: "mainTint")
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = .white
    }
}
