// ShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображает какая обувь в наличии
final class ShoesViewController: UIViewController {
    // MARK: - Visual Components

    let blackHeelsImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.blackHeelsImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let lofersImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.lofersImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let yellowImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.yellowImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let sportImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.sportImageView)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let conversImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.image = UIImage(named: Constants.conversImage)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var shoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Constants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var lofershoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Constants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var yelowshoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Constants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var sportShoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Constants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var conversShoesBackgroundView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Constants.buttonCatalog)
        element.layer.cornerRadius = 20
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var conversShoesLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.conversPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 10)
        return element
    }()

    lazy var blackHeelsshoesLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.blackHeelsPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 10)
        return element
    }()

    lazy var lofershoesLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.lofersPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 10)
        return element
    }()

    lazy var yellowShoesLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.yellowShoesPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 10)
        return element
    }()

    lazy var sportshoesLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.sportShoesPrice
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont(name: Constants.verdanaBold, size: 10)
        return element
    }()

    lazy var basketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: Constants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var lofersBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: Constants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var yelowBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: Constants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var sportBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: Constants.basketButton) {
            element.setBackgroundImage(image, for: .normal)
        }
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(basketButtonTapped), for: .touchDown)
        return element
    }()

    lazy var conversBasketButton: UIButton = {
        let element = UIButton(type: .system)
        if let image = UIImage(named: Constants.basketButton) {
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
        yelowshoesBackgroundView.addSubview(yelowBasketButton)
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
        title = Constants.shoesTitle
    }

    @objc private func basketButtonTapped(sender: UIButton) {
        if let currentImage = sender.backgroundImage(for: .normal),
           currentImage == UIImage(named: Constants.basketButtonFull)
        {
            sender.setBackgroundImage(UIImage(named: Constants.basketButton), for: .normal)
            return
        }

        let basket = SizeViewController()
        basket.modalPresentationStyle = .formSheet
        present(basket, animated: true, completion: nil)

        if let currentImage = sender.backgroundImage(for: .normal) {
            if currentImage == UIImage(named: Constants.basketButton) {
                sender.setBackgroundImage(UIImage(named: Constants.basketButtonFull), for: .normal)
            } else {
                sender.setBackgroundImage(UIImage(named: Constants.basketButton), for: .normal)
            }
        }
    }
}
