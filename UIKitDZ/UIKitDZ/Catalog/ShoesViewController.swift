// ShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображает какая обувь в наличии
final class ShoesViewController: UIViewController {
    private var blackHeelsArray = [AppConstants.blackHeelsImage, AppConstants.blackHeelsPrice]
    private var lofersShoesArray = [AppConstants.lofersImage, AppConstants.lofersPrice]
    private var yellowShoesArray = [AppConstants.yellowImage, AppConstants.yellowShoesPrice]
    private var sportShoesArray = [AppConstants.sportImageView, AppConstants.sportShoesPrice]
    private var conversArray = [AppConstants.conversImage, AppConstants.conversPrice]
    private var currentArray = [String]()

    // MARK: - Visual Components

    let blackHeelsImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: AppConstants.blackHeelsImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let lofersImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: AppConstants.lofersImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let yellowImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: AppConstants.yellowImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let sportImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: AppConstants.sportImageView)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let conversImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: AppConstants.conversImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var shoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: AppConstants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var lofershoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: AppConstants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var yelowshoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: AppConstants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var sportShoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: AppConstants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var conversShoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: AppConstants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var conversShoesLabel: UILabel = {
        let element = UILabel()
        element.text = AppConstants.conversPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: AppConstants.verdanaBold, size: 10)
        return element
    }()

    lazy var blackHeelsshoesLabel: UILabel = {
        let element = UILabel()
        element.text = AppConstants.blackHeelsPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: AppConstants.verdanaBold, size: 10)
        return element
    }()

    lazy var lofershoesLabel: UILabel = {
        let element = UILabel()
        element.text = AppConstants.lofersPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: AppConstants.verdanaBold, size: 10)
        return element
    }()

    lazy var yellowShoesLabel: UILabel = {
        let element = UILabel()
        element.text = AppConstants.yellowShoesPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: AppConstants.verdanaBold, size: 10)
        return element
    }()

    lazy var sportshoesLabel: UILabel = {
        let element = UILabel()
        element.text = AppConstants.sportShoesPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: AppConstants.verdanaBold, size: 10)
        return element
    }()

    lazy var basketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: AppConstants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var lofersBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: AppConstants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var yellowBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: AppConstants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var sportBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: AppConstants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var conversBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: AppConstants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigionBar()
        setupUI()
        setupConstraints()
        setupLabelConstraints()
        setupButtonConstraints()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.addSubview(shoesBackgroundView)
        shoesBackgroundView.addSubview(blackHeelsshoesLabel)
        shoesBackgroundView.addSubview(blackHeelsImageView)
        shoesBackgroundView.addSubview(basketButton)
        view.addSubview(lofershoesBackgroundView)
        lofershoesBackgroundView.addSubview(lofershoesLabel)
        lofershoesBackgroundView.addSubview(lofersImageView)
        lofershoesBackgroundView.addSubview(lofersBasketButton)
        view.addSubview(yelowshoesBackgroundView)
        yelowshoesBackgroundView.addSubview(yellowShoesLabel)
        yelowshoesBackgroundView.addSubview(yellowImageView)
        yelowshoesBackgroundView.addSubview(yellowBasketButton)
        view.addSubview(sportShoesBackgroundView)
        sportShoesBackgroundView.addSubview(sportshoesLabel)
        sportShoesBackgroundView.addSubview(sportImageView)
        sportShoesBackgroundView.addSubview(sportBasketButton)
        view.addSubview(conversShoesBackgroundView)
        conversShoesBackgroundView.addSubview(conversShoesLabel)
        conversShoesBackgroundView.addSubview(conversImageView)
        conversShoesBackgroundView.addSubview(conversBasketButton)
    }

    private func setupNavigionBar() {
        navigationController?.navigationBar.tintColor = .black
        title = AppConstants.shoesTitle
    }

    @objc private func basketButtonTapped(sender: UIButton) {
        if let currentImage = sender.backgroundImage(for: .normal) {
            if currentImage == UIImage(named: AppConstants.basketButtonFull) {
                sender.setBackgroundImage(UIImage(named: AppConstants.basketButton), for: .normal)
                return
            } else {
                switch sender {
                case conversBasketButton:
                    currentArray = conversArray
                case sportBasketButton:
                    currentArray = sportShoesArray
                case yellowBasketButton:
                    currentArray = yellowShoesArray
                case basketButton:
                    currentArray = blackHeelsArray
                default:
                    printContent("Somthing wrong")
                }
                print(currentArray)
                UserBasket.basket.usersSupply = currentArray
            }
        }
        let basket = SizeViewController()
        basket.modalPresentationStyle = .formSheet
        present(basket, animated: true, completion: nil)

        if let currentImage = sender.backgroundImage(for: .normal) {
            if currentImage == UIImage(named: AppConstants.basketButton) {
                sender.setBackgroundImage(UIImage(named: AppConstants.basketButtonFull), for: .normal)
            } else {
                sender.setBackgroundImage(UIImage(named: AppConstants.basketButton), for: .normal)
            }
        }
    }
}
