// RecommendTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка отображающая рекомендации
final class RecommendTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let titleLabel = UILabel()
    private let rightLabel = UILabel()

    private let groundView = UIView()
    private let secondGroundView = UIView()

    private let avatarImageView = UIImageView()
    private let secondAvatarImageView = UIImageView()

    private let nameUserLabel = UILabel()
    private let secondNameUserLabel = UILabel()

    private let subscribeButton = UIButton()
    private let secondSubscribeButton = UIButton()
    private let closeButton = UIButton()
    private let secondCloseButton = UIButton()

    private let scrollView = UIScrollView()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configContentView()
        configScroll()
        configTitle()
        configRightTitle()
        configView()
        configImage()
        configCesondView()
        configNickName()
        configButton()
        configCloseButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configCell(model: Recommend) {
        titleLabel.text = model.title
        rightLabel.text = model.allText
        nameUserLabel.text = model.nameUser
        secondNameUserLabel.text = model.secondNameUser
        avatarImageView.image = UIImage(named: model.nameImage)
        subscribeButton.setTitle(model.titleButton, for: .normal)
        secondSubscribeButton.setTitle(model.titleButton, for: .normal)
        secondAvatarImageView.image = UIImage(named: model.secondAvatar)
    }

    // MARK: - Private Methods

    private func configContentView() {
        contentView.backgroundColor = #colorLiteral(red: 0.8560082316, green: 0.8998804688, blue: 0.9470122457, alpha: 1)
    }

    private func configScroll() {
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = contentView.bounds.size
        scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }

    private func configTitle() {
        scrollView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 9).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 270).isActive = true
    }

    private func configRightTitle() {
        scrollView.addSubview(rightLabel)
        rightLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        rightLabel.textAlignment = .right
        rightLabel.textColor = .blue
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        rightLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        rightLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 139).isActive = true
        rightLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 9).isActive = true
    }

    private func configView() {
        scrollView.addSubview(groundView)
        groundView.backgroundColor = .white
        groundView.translatesAutoresizingMaskIntoConstraints = false
        groundView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        groundView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        groundView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
        groundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -25).isActive = true
        groundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 17).isActive = true
    }

    private func configCesondView() {
        scrollView.addSubview(secondGroundView)
        secondGroundView.backgroundColor = .white
        secondGroundView.translatesAutoresizingMaskIntoConstraints = false
        secondGroundView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        secondGroundView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        secondGroundView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
        secondGroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -25).isActive = true
        secondGroundView.leadingAnchor.constraint(equalTo: groundView.trailingAnchor, constant: 20).isActive = true
        secondGroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 17).isActive = true
    }

    private func configImage() {
        groundView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: groundView.topAnchor, constant: 15).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: groundView.leadingAnchor, constant: 35).isActive = true

        secondGroundView.addSubview(secondAvatarImageView)
        secondAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        secondAvatarImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondAvatarImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        secondAvatarImageView.topAnchor.constraint(equalTo: secondGroundView.topAnchor, constant: 15).isActive = true
        secondAvatarImageView.leadingAnchor.constraint(equalTo: secondGroundView.leadingAnchor, constant: 35)
            .isActive = true
    }

    private func configNickName() {
        groundView.addSubview(nameUserLabel)
        nameUserLabel.font = UIFont.systemFont(ofSize: 10)
        nameUserLabel.textAlignment = .center
        nameUserLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUserLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameUserLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        nameUserLabel.topAnchor.constraint(equalTo: groundView.topAnchor, constant: 135).isActive = true
        nameUserLabel.leadingAnchor.constraint(equalTo: groundView.leadingAnchor, constant: 42).isActive = true

        secondGroundView.addSubview(secondNameUserLabel)
        secondNameUserLabel.font = UIFont.systemFont(ofSize: 10)
        secondNameUserLabel.textAlignment = .center
        secondNameUserLabel.translatesAutoresizingMaskIntoConstraints = false
        secondNameUserLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondNameUserLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        secondNameUserLabel.topAnchor.constraint(equalTo: secondGroundView.topAnchor, constant: 135).isActive = true
        secondNameUserLabel.leadingAnchor.constraint(equalTo: secondGroundView.leadingAnchor, constant: 42)
            .isActive = true
    }

    private func configButton() {
        groundView.addSubview(subscribeButton)
        subscribeButton.backgroundColor = #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1)
        subscribeButton.layer.cornerRadius = 8
        subscribeButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscribeButton.bottomAnchor.constraint(equalTo: groundView.bottomAnchor, constant: 14).isActive = true
        subscribeButton.leadingAnchor.constraint(equalTo: groundView.leadingAnchor, constant: 10).isActive = true

        secondGroundView.addSubview(secondSubscribeButton)
        secondSubscribeButton.backgroundColor = #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1)
        secondSubscribeButton.layer.cornerRadius = 8
        secondSubscribeButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        secondSubscribeButton.translatesAutoresizingMaskIntoConstraints = false
        secondSubscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        secondSubscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        secondSubscribeButton.bottomAnchor.constraint(equalTo: secondGroundView.bottomAnchor, constant: 14)
            .isActive = true
        secondSubscribeButton.leadingAnchor.constraint(equalTo: secondGroundView.leadingAnchor, constant: 10)
            .isActive = true
    }

    private func configCloseButton() {
        groundView.addSubview(closeButton)
        closeButton.setImage(UIImage(named: AppConstants.closeText), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
        closeButton.topAnchor.constraint(equalTo: groundView.topAnchor, constant: 9).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: groundView.trailingAnchor, constant: -9).isActive = true

        secondGroundView.addSubview(secondCloseButton)
        secondCloseButton.setImage(UIImage(named: AppConstants.closeText), for: .normal)
        secondCloseButton.translatesAutoresizingMaskIntoConstraints = false
        secondCloseButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        secondCloseButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
        secondCloseButton.topAnchor.constraint(equalTo: secondGroundView.topAnchor, constant: 9).isActive = true
        secondCloseButton.trailingAnchor.constraint(equalTo: secondGroundView.trailingAnchor, constant: -9)
            .isActive = true
    }
}
