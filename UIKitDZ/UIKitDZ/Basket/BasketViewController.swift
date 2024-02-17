// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображающий корзину с товаром
final class BasketViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let titleText = "Корзина"
        static let genderText = "Женские ботинки"
        static let basket = "Корзина на товаре"
        static let count = "Количество"
        static let size = "Размер"
        static let price = "Цена"
        static let plus = "+"
        static let minus = "-"

        static let sizeThirtyFiveLabel = "35"
        static let sizeThirtySixLabel = "36"
        static let sizeThirtySevenLabel = "37"
        static let sizeThirtyЕightLabel = "38"
        static let sizeThirtyNineLabel = "39"

        static let basketEmpty = "Ваша корзина пуста"
        static let transition = "Перейдие в каталог и добавьте товары в корзину"
        static let bag = "bag"
        static let checkoutText = "Оформить заказ -"
        static let ruble = "₽"
    }

    // MARK: - Visual Components

    private let shoesView = UIView()
    private let shoesImageView = UIImageView()

    private let femaleShoesLabel = UILabel()
    private let countLabel = UILabel()
    private let sizeLabel = UILabel()
    private let priceLabel = UILabel()
    private let priceShoesLabel = UILabel()
    private let countSelectLabel = UILabel()

    private let sizeThirtyFiveButton = UIButton()
    private let sizeThirtySixButton = UIButton()
    private let sizeThirtySevenButton = UIButton()
    private let sizeThirtyЕightButton = UIButton()
    private let sizeThirtyNineButton = UIButton()

    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private let checkoutButton = UIButton()

    private let basketButton = UIButton()

    private let basketEmptyLabel = UILabel()
    private let transitionLabel = UILabel()
    private let grayView = UIView()
    private let bagEmtyImageView = UIImageView()

    private var countShoes = 1
    private var priceShoes = Int()
    private var sum = 0
    private var nameChoes = ""

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoShoes()
        configView()
    }

    override func viewWillAppear(_ animated: Bool) {
        configGroundShoes()
        configImage()
        setupLabel()
        configBasket()
        setupCountButton()
        configCountLabel()
        setupSize()
        configCheckout()
        configPriceShoesLabel()
    }

    // MARK: - Private Methods

    func setupInfoShoes() {
        guard !UserBasket.basket.usersSupply.isEmpty else { return }
        priceShoes = Int(UserBasket.basket.usersSupply[1]) ?? 0
        nameChoes = UserBasket.basket.usersSupply[0]
    }

    private func configView() {
        title = Constants.titleText
    }

    private func configGroundShoes() {
        view.addSubview(shoesView)
        shoesView.backgroundColor = #colorLiteral(red: 0.9782040715, green: 0.9782039523, blue: 0.9782040715, alpha: 1)
        shoesView.translatesAutoresizingMaskIntoConstraints = false
        shoesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        shoesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116).isActive = true
        shoesView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        shoesView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        shoesView.layer.cornerRadius = 12
    }

    private func configImage() {
        shoesView.addSubview(shoesImageView)
        shoesImageView.image = UIImage(named: nameChoes)
        shoesImageView.translatesAutoresizingMaskIntoConstraints = false
        shoesImageView.leftAnchor.constraint(equalTo: shoesView.leftAnchor, constant: 28).isActive = true
        shoesImageView.topAnchor.constraint(equalTo: shoesView.topAnchor, constant: 29).isActive = true
        shoesImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoesImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func configLabel(nameLabel: UILabel, text: String, top: CGFloat) {
        view.addSubview(nameLabel)
        nameLabel.text = text
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 193).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        nameLabel.font = UIFont.systemFont(ofSize: 12)
    }

    private func setupLabel() {
        configLabel(nameLabel: femaleShoesLabel, text: Constants.genderText, top: 134)
        configLabel(nameLabel: countLabel, text: Constants.count, top: 161)
        configLabel(nameLabel: sizeLabel, text: Constants.size, top: 188)
        configLabel(nameLabel: priceLabel, text: Constants.price, top: 258)
    }

    private func configBasket() {
        shoesView.addSubview(basketButton)
        basketButton.setImage(UIImage(named: Constants.basket), for: .normal)
        basketButton.translatesAutoresizingMaskIntoConstraints = false
        basketButton.leftAnchor.constraint(equalTo: shoesView.leftAnchor, constant: 127).isActive = true
        basketButton.topAnchor.constraint(equalTo: shoesView.topAnchor, constant: 11).isActive = true
        basketButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketButton.heightAnchor.constraint(equalToConstant: 19).isActive = true
        basketButton.addTarget(self, action: #selector(clearViews), for: .touchUpInside)
    }

    private func setupSize() {
        configSize(nameButton: sizeThirtyFiveButton, text: Constants.sizeThirtyFiveLabel, left: 199)
        configSize(nameButton: sizeThirtySixButton, text: Constants.sizeThirtySixLabel, left: 234)
        configSize(nameButton: sizeThirtySevenButton, text: Constants.sizeThirtySevenLabel, left: 269)
        configSize(nameButton: sizeThirtyЕightButton, text: Constants.sizeThirtyЕightLabel, left: 305)
        view.addSubview(sizeThirtyNineButton)
        sizeThirtyNineButton.setTitle(Constants.sizeThirtyNineLabel, for: .normal)
        sizeThirtyNineButton.translatesAutoresizingMaskIntoConstraints = false
        sizeThirtyNineButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 199).isActive = true
        sizeThirtyNineButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 234).isActive = true
        sizeThirtyNineButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
        sizeThirtyNineButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        sizeThirtyNineButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        sizeThirtyNineButton.backgroundColor = #colorLiteral(red: 0.9856336713, green: 0.9391976595, blue: 0.9656866193, alpha: 1)
        sizeThirtyNineButton.clipsToBounds = true
        sizeThirtyNineButton.setTitleColor(.black, for: .normal)
        sizeThirtyNineButton.layer.cornerRadius = 10
        sizeThirtyNineButton.titleLabel?.textAlignment = .center
    }

    private func configCheckout() {
        view.addSubview(checkoutButton)
        checkoutButton.setTitle(Constants.checkoutText, for: .normal)
        checkoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        checkoutButton.backgroundColor = #colorLiteral(red: 0.9155070186, green: 0.2173944712, blue: 0.5847681761, alpha: 1)
        checkoutButton.layer.cornerRadius = 12
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        checkoutButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        checkoutButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        checkoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654).isActive = true
    }

    private func configBasketView() {
        view.addSubview(grayView)
        grayView.backgroundColor = #colorLiteral(red: 0.9782040715, green: 0.9782039523, blue: 0.9782040715, alpha: 1)
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 152).isActive = true
        grayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 290).isActive = true
        grayView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        grayView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        grayView.layer.cornerRadius = 12
        grayView.layer.borderWidth = 0.7
        grayView.layer.borderColor = UIColor.black.cgColor
    }

    private func configBag() {
        grayView.addSubview(bagEmtyImageView)
        bagEmtyImageView.image = UIImage(named: Constants.bag)
        bagEmtyImageView.translatesAutoresizingMaskIntoConstraints = false
        bagEmtyImageView.leftAnchor.constraint(equalTo: grayView.leftAnchor, constant: 19).isActive = true
        bagEmtyImageView.topAnchor.constraint(equalTo: grayView.topAnchor, constant: 17).isActive = true
        bagEmtyImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        bagEmtyImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }

    private func configLabelEmpty() {
        view.addSubview(basketEmptyLabel)
        basketEmptyLabel.text = Constants.basketEmpty
        basketEmptyLabel.translatesAutoresizingMaskIntoConstraints = false
        basketEmptyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80).isActive = true
        basketEmptyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 378).isActive = true
        basketEmptyLabel.widthAnchor.constraint(equalToConstant: 215).isActive = true
        basketEmptyLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        basketEmptyLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        basketEmptyLabel.textAlignment = .center
    }

    private func configTransitionLabel() {
        view.addSubview(transitionLabel)
        transitionLabel.text = Constants.transition
        transitionLabel.translatesAutoresizingMaskIntoConstraints = false
        transitionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        transitionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 422).isActive = true
        transitionLabel.widthAnchor.constraint(equalToConstant: 275).isActive = true
        transitionLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        transitionLabel.font = UIFont.systemFont(ofSize: 16)
        transitionLabel.textAlignment = .center
        transitionLabel.numberOfLines = 2
        transitionLabel.textColor = #colorLiteral(red: 0.4905452132, green: 0.5193168521, blue: 0.5706592202, alpha: 1)
    }

    private func configCountButton(nameButton: UIButton, text: String, left: CGFloat) {
        view.addSubview(nameButton)
        nameButton.setTitle(text, for: .normal)
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        nameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 162).isActive = true
        nameButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        nameButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        nameButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        nameButton.layer.cornerRadius = 10
        nameButton.backgroundColor = #colorLiteral(red: 0.9856336713, green: 0.9391976595, blue: 0.9656866193, alpha: 1)
        nameButton.setTitleColor(.black, for: .normal)
    }

    private func setupCountButton() {
        configCountButton(nameButton: plusButton, text: Constants.plus, left: 333)
        configCountButton(nameButton: minusButton, text: Constants.minus, left: 295)
        plusButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
    }

    private func configCountLabel() {
        view.addSubview(countSelectLabel)
        countSelectLabel.text = String(countShoes)
        countSelectLabel.translatesAutoresizingMaskIntoConstraints = false
        countSelectLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 313).isActive = true
        countSelectLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 162).isActive = true
        countSelectLabel.widthAnchor.constraint(equalToConstant: 17).isActive = true
        countSelectLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        countSelectLabel.textAlignment = .center
    }

    func configPriceShoesLabel() {
        view.addSubview(priceShoesLabel)
        priceShoesLabel.text = String(priceShoes) + " \(Constants.ruble)"
        priceShoesLabel.translatesAutoresizingMaskIntoConstraints = false
        priceShoesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 296).isActive = true
        priceShoesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        priceShoesLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        priceShoesLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        priceShoesLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }

    private func configSize(nameButton: UIButton, text: String, left: CGFloat) {
        view.addSubview(nameButton)
        nameButton.setTitle(text, for: .normal)
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        nameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 213).isActive = true
        nameButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
        nameButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        nameButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        nameButton.backgroundColor = #colorLiteral(red: 0.9856336713, green: 0.9391976595, blue: 0.9656866193, alpha: 1)
        nameButton.clipsToBounds = true
        nameButton.layer.cornerRadius = 10
        nameButton.titleLabel?.textAlignment = .center
        nameButton.setTitleColor(.black, for: .normal)
        nameButton.addTarget(self, action: #selector(changeBorder), for: .touchUpInside)
    }

    @objc private func changeBorder(_ sender: UIButton) {
        sender.layer.borderWidth = 0.7
        sender.layer.borderColor = #colorLiteral(red: 0.9155070186, green: 0.2173944712, blue: 0.5847681761, alpha: 1)
    }

    @objc private func clearViews() {
        shoesView.removeFromSuperview()
        shoesImageView.removeFromSuperview()
        femaleShoesLabel.removeFromSuperview()
        countLabel.removeFromSuperview()
        sizeLabel.removeFromSuperview()
        priceLabel.removeFromSuperview()
        countSelectLabel.removeFromSuperview()
        sizeThirtyFiveButton.removeFromSuperview()
        sizeThirtySixButton.removeFromSuperview()
        sizeThirtySevenButton.removeFromSuperview()
        sizeThirtyЕightButton.removeFromSuperview()
        sizeThirtyNineButton.removeFromSuperview()
        plusButton.removeFromSuperview()
        minusButton.removeFromSuperview()
        checkoutButton.removeFromSuperview()
        basketButton.removeFromSuperview()
        priceShoesLabel.removeFromSuperview()

        configLabelEmpty()
        configBasketView()
        configBag()
        configTransitionLabel()
    }

    @objc private func increaseCount() {
        countShoes += 1
        sum = priceShoes * countShoes
        let checkoutButtonText = "\(Constants.checkoutText)\(String(sum))\(Constants.ruble)"
        configCountLabel()
        checkoutButton.setTitle(checkoutButtonText, for: .normal)
    }

    @objc func decreaseCount() {
        countShoes -= 1
        let lessCost = sum - priceShoes
        let checkoutButtonText = "\(Constants.checkoutText)\(String(lessCost))\(Constants.ruble)"
        configCountLabel()
        checkoutButton.setTitle(checkoutButtonText, for: .normal)
    }
}
