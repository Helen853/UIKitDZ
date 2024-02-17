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
                title: AppConstants.catalogTabBarName,
                image: UIImage(named: AppConstants.catalogEmptyImage),
                selectedImage: UIImage(named: AppConstants.catalogFullImage)
            ),
            generateVC(
                viewController: BasketViewController(),
                title: AppConstants.basketTitle,
                image: UIImage(named: AppConstants.basketEmpty),
                selectedImage: UIImage(named: AppConstants.basketFull)
            ),
            generateVC(
                viewController: ProfileViewController(),
                title: AppConstants.profileTitle,
                image: UIImage(named: AppConstants.profileEmpty),
                selectedImage: UIImage(named: AppConstants.profileFull)
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
        tabBar.tintColor = UIColor(named: AppConstants.mainTint)
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = .white
    }
}
