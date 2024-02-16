// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображающий профиль пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let titleText = "Профиль"
        static let dataTitle = "Личные данные"
        static let myData = "Мои данные"
        static let bringFriend = "Приведи друга"
        static let feedbackText = "Обратная связь"

        static let profile = "Profile"
        static let logo = "Logo card"
        static let code = "Promo"
        static let mark = "Знак"

        static let percent = "15%"

        static let number = "1000 0001 0102"
    }

    // MARK: - Visual Components

    private let titleLabel = UILabel()

    private let dataImageView = UIImageView()
    private let friendImageView = UIImageView()
    private let feedBackImageView = UIImageView()
    private let logoImageView = UIImageView()
    private let promoImageView = UIImageView()
    private let markImageView = UIImageView()

    private let percentLabel = UILabel()
    private let numberLabel = UILabel()
    private let bringFriendLabel = UILabel()
    private let feedbackLabel = UILabel()

    private let cardView = UIView()
    private let dataLineView = UIView()
    private let friendLineView = UIView()
    private let feedbackLineView = UIView()

    private let myDataButton = UIButton()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configPersonalData()
        setupImage()
        setupDataButton()
        configCardView()
        configLogoCard()
        configPromo()
        configPersent()
        configNumber()
        configMark()
        configLabel()
        setupLine()
    }

    // MARK: - Private Methods

    private func configView() {
        title = Constants.titleText
        view.backgroundColor = .white
    }

    private func configPersonalData() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.text = Constants.dataTitle
        titleLabel.textColor = .black

        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 328).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    private func configImageView(nameImageView: UIImageView, top: CGFloat, nameImage: String) {
        view.addSubview(nameImageView)
        nameImageView.translatesAutoresizingMaskIntoConstraints = false
        nameImageView.image = UIImage(named: nameImage)
        nameImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23).isActive = true
        nameImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        nameImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
    }

    private func setupImage() {
        configImageView(
            nameImageView: dataImageView,
            top: 374,
            nameImage: Constants.myData
        )
        configImageView(
            nameImageView: friendImageView,
            top: 427,
            nameImage: Constants.bringFriend
        )
        configImageView(
            nameImageView: feedBackImageView,
            top: 479,
            nameImage: Constants.feedbackText
        )
    }

    private func setupDataButton() {
        view.addSubview(myDataButton)
        myDataButton.setTitle(Constants.myData, for: .normal)
        myDataButton.setTitleColor(.black, for: .normal)
        myDataButton.titleLabel?.textAlignment = .left
        myDataButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        myDataButton.translatesAutoresizingMaskIntoConstraints = false
        myDataButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17).isActive = true
        myDataButton.widthAnchor.constraint(equalToConstant: 163).isActive = true
        myDataButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        myDataButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 372).isActive = true

        myDataButton.addTarget(self, action: #selector(showMyData), for: .touchUpInside)
    }

    @objc private func showMyData() {
        let userDataViewController = UserDataViewController()
        userDataViewController.modalPresentationStyle = .fullScreen
        present(userDataViewController, animated: true)
    }

    private func configCardView() {
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        cardView.backgroundColor = .black
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowOpacity = 3
        cardView.addSubview(logoImageView)
    }

    private func configLogoCard() {
        cardView.addSubview(logoImageView)
        logoImageView.image = UIImage(named: Constants.logo)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 8).isActive = true
        logoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func configPromo() {
        cardView.addSubview(promoImageView)
        promoImageView.image = UIImage(named: Constants.code)
        promoImageView.translatesAutoresizingMaskIntoConstraints = false
        promoImageView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -19).isActive = true
        promoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 21).isActive = true
        promoImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        promoImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func configPersent() {
        cardView.addSubview(percentLabel)
        percentLabel.text = Constants.percent
        percentLabel.textColor = .white
        percentLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 14).isActive = true
        percentLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 116).isActive = true
        percentLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        percentLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func configNumber() {
        cardView.addSubview(numberLabel)
        numberLabel.text = Constants.number
        numberLabel.textColor = .white
        numberLabel.font = UIFont.systemFont(ofSize: 14)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 14).isActive = true
        numberLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 142).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 118).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func configMark() {
        cardView.addSubview(markImageView)
        markImageView.image = UIImage(named: Constants.mark)
        markImageView.translatesAutoresizingMaskIntoConstraints = false
        markImageView.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -27).isActive = true
        markImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 137).isActive = true
        markImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        markImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }

    private func configLabelTitle(nameLabel: UILabel, text: String, top: CGFloat) {
        view.addSubview(nameLabel)
        nameLabel.text = text
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 57).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
    }

    private func configLabel() {
        configLabelTitle(
            nameLabel: bringFriendLabel,
            text: Constants.bringFriend,
            top: 424
        )
        configLabelTitle(
            nameLabel: feedbackLabel,
            text: Constants.feedbackText,
            top: 476
        )
    }

    private func configLine(nameLine: UIView, top: CGFloat) {
        view.addSubview(nameLine)
        nameLine.backgroundColor = #colorLiteral(red: 0.9405570626, green: 0.9373734593, blue: 0.9373063445, alpha: 1)
        nameLine.translatesAutoresizingMaskIntoConstraints = false
        nameLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLine.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        nameLine.widthAnchor.constraint(equalToConstant: 335).isActive = true
        nameLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func setupLine() {
        configLine(nameLine: dataLineView, top: 403)
        configLine(nameLine: friendLineView, top: 455)
        configLine(nameLine: feedbackLineView, top: 507)
    }
}
