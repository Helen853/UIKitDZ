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
                title: Constants.catalogTabBarName,
                image: UIImage(named: Constants.catalogEmptyImage),
                selectedImage: UIImage(named: Constants.catalogFullImage)
            ),
            generateVC(
                viewController: BasketViewController(),
                title: Constants.basketTitle,
                image: UIImage(named: Constants.basketEmpty),
                selectedImage: UIImage(named: Constants.basketFull)
            ),
            generateVC(
                viewController: ProfileViewController(),
                title: Constants.profileTitle,
                image: UIImage(named: Constants.profileEmpty),
                selectedImage: UIImage(named: Constants.profileFull)
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
        tabBar.tintColor = UIColor(named: Constants.mainTint)
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = .white
    }
}
