// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для отображения главного меню каталога
final class СatalogViewController: UIViewController {
    // MARK: - Constants

    let segmentedControll = UISegmentedControl(items: [
        Constants.womenCategory,
        Constants.menCategory,
        Constants.childrenCategory
    ])

    // MARK: - Private Properties

    private let menArray = [
        UIImage(named: Constants.menNewArrivals),
        UIImage(named: Constants.menSaleItems)
    ]

    private let womanArray = [
        UIImage(named: Constants.womenNewArrivals),
        UIImage(named: Constants.womenSaleItems)
    ]
    private let childrenArray = [
        UIImage(named: Constants.childrenNewArrivals),
        UIImage(named: Constants.childrenSaleItems)
    ]

    private let manItemArray = [
        UIImage(named: Constants.menShoes),
        UIImage(named: Constants.menBags)
    ]

    private let womanItemArray = [
        UIImage(named: Constants.womenShoes),
        UIImage(named: Constants.womenBags)
    ]

    private let childrenItemArray = [
        UIImage(named: Constants.childrenShoes),
        UIImage(named: Constants.childrenBags)
    ]

    // MARK: - Visual Components

    lazy var brendButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(named: Constants.catalogColor)
        element.layer.cornerRadius = 12
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var shoesButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(named: Constants.catalogColor)
        element.layer.cornerRadius = 12
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(shoesButtonTapped), for: .touchUpInside)
        return element
    }()

    lazy var bagsButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(named: Constants.catalogColor)
        element.layer.cornerRadius = 12
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var brendsLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.brandsLabelTitle
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 14)
        return element
    }()

    lazy var shoesLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.shoesLabelTitle
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 14)
        return element
    }()

    lazy var bagLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.bagLabelTitle
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 14)
        return element
    }()

    lazy var newLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.newLabelTitle
        element.textColor = .white
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 14)
        return element
    }()

    lazy var saleLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.saleLabelTitle
        element.textColor = .white
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 14)
        return element
    }()

    let brandsImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.brandsImageName)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let shoesImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.shoesImageName)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let bagImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.bagImageName)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var newImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.newImageName)
        element.layer.shadowRadius = 5
        element.layer.shadowColor = UIColor.gray.cgColor
        element.layer.shadowOpacity = 0.8
        element.layer.shadowOffset = CGSize(width: 0, height: 2)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let saleImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.saleImageName)
        element.layer.shadowRadius = 5
        element.layer.shadowColor = UIColor.gray.cgColor
        element.layer.shadowOpacity = 0.8
        element.layer.shadowOffset = CGSize(width: 0, height: 2)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupNavigionBar()
        setupSegmentedControll()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.addSubview(segmentedControll)
        view.addSubview(brendButton)
        view.addSubview(shoesButton)
        view.addSubview(bagsButton)
        brendButton.addSubview(brendsLabel)
        brendButton.addSubview(brandsImageView)
        shoesButton.addSubview(shoesLabel)
        bagsButton.addSubview(bagLabel)
        shoesButton.addSubview(shoesImageView)
        bagsButton.addSubview(bagImageView)
        view.addSubview(newImageView)
        newImageView.addSubview(newLabel)
        view.addSubview(saleImageView)
        saleImageView.addSubview(saleLabel)
    }

    private func setupSegmentedControll() {
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        segmentedControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        segmentedControll.selectedSegmentIndex = 1
        segmentedControll.layer.cornerRadius = 20
        let font = UIFont(name: Constants.verdanaBold, size: 14) ?? UIFont.boldSystemFont(ofSize: 14)
        segmentedControll.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }

    private func setupNavigionBar() {
        title = Constants.catalogButtonTitle
        navigationItem.titleView?.tintColor = .black

        let cameraImage = UIImage(named: Constants.cameraImageName)
        let cameraBarItem = UIBarButtonItem(image: cameraImage, style: .plain, target: nil, action: nil)
        cameraBarItem.tintColor = UIColor.black

        let qrCodeImage = UIImage(named: Constants.qrCodeImageName)
        let qrCodeBarItem = UIBarButtonItem(image: qrCodeImage, style: .plain, target: nil, action: nil)
        qrCodeBarItem.tintColor = UIColor.black

        navigationItem.rightBarButtonItems = [qrCodeBarItem, cameraBarItem]
    }

    @objc private func selectedValue(target: UISegmentedControl) {
        let segmentIndex = target.selectedSegmentIndex

        switch segmentIndex {
        case 0:
            newImageView.image = womanArray[0]
            saleImageView.image = womanArray[1]
            shoesImageView.image = womanItemArray[0]
            bagImageView.image = womanItemArray[1]
        case 1:
            newImageView.image = menArray[0]
            saleImageView.image = menArray[1]
            shoesImageView.image = manItemArray[0]
            bagImageView.image = manItemArray[1]
        case 2:
            newImageView.image = childrenArray[0]
            saleImageView.image = childrenArray[1]
            shoesImageView.image = childrenItemArray[0]
            bagImageView.image = childrenItemArray[1]
        default:
            break
        }
    }

    @objc private func shoesButtonTapped() {
        if segmentedControll.selectedSegmentIndex == 0 {
            let shoesViewController = ShoesViewController()
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationItem.titleView?.tintColor = .black
            navigationController?.pushViewController(shoesViewController, animated: true)
        }
    }
}
