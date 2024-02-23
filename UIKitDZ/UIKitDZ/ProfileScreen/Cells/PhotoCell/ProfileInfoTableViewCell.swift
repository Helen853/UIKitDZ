// ProfileInfoTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ProfileInfoTableViewCell: UITableViewCell {
    private let avatarImageView = UIImageView()
    private let nameUserLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let countPostLabel = UILabel()
    private let countFolowersLabel = UILabel()
    private let countSubscriptionsLabel = UILabel()
    private let postLabel = UILabel()
    private let folowersLabel = UILabel()
    private let subscriptionsLabel = UILabel()
    private let changeButton = UIButton()
    private let shareButton = UIButton()
    private let plusButton = UIButton()
    private let urlButton = UIButton()

    var showSpacexHandler: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAvatar()
        configureUserName()
        setupCountLabel()
        setupTitleLabel()
        configureUserDescription()
        setupButton()
        configButton()
        configureButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(model: ProfileInfo, tapOnButton: (() -> Void)?) {
        avatarImageView.image = UIImage(named: model.avatarName)
        nameUserLabel.text = model.userName
        countPostLabel.text = model.countPost
        countFolowersLabel.text = model.countFollowers
        countSubscriptionsLabel.text = model.countsubscriptions
        descriptionLabel.text = model.description
        showSpacexHandler = tapOnButton
    }

    func configureButton() {
        contentView.addSubview(urlButton)
        urlButton.setTitle(AppConstants.urlSpacex, for: .normal)
        urlButton.setTitleColor(.blue, for: .normal)
        urlButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        urlButton.translatesAutoresizingMaskIntoConstraints = false
        urlButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        urlButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        urlButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        urlButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6).isActive = true
        urlButton.addTarget(self, action: #selector(urlTapped), for: .touchUpInside)
    }

    @objc func urlTapped() {
        showSpacexHandler?()
    }

    private func configureAvatar() {
        contentView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
    }

    private func configureUserName() {
        contentView.addSubview(nameUserLabel)
        nameUserLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        nameUserLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUserLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        nameUserLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        nameUserLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        nameUserLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
//        nameUserLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func configureCountLabel(nameLabel: UILabel) {
        contentView.addSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
    }

    private func setupCountLabel() {
        configureCountLabel(nameLabel: countPostLabel)
        configureCountLabel(nameLabel: countFolowersLabel)
        configureCountLabel(nameLabel: countSubscriptionsLabel)
        countPostLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 56).isActive = true
        countFolowersLabel.leadingAnchor.constraint(equalTo: countPostLabel.trailingAnchor, constant: 20)
            .isActive = true
        countSubscriptionsLabel.leadingAnchor.constraint(equalTo: countFolowersLabel.trailingAnchor, constant: 21)
            .isActive = true
    }

    func configTitleLabel(nameLabel: UILabel) {
        contentView.addSubview(nameLabel)
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 41).isActive = true
    }

    func setupTitleLabel() {
        configTitleLabel(nameLabel: postLabel)
        configTitleLabel(nameLabel: folowersLabel)
        configTitleLabel(nameLabel: subscriptionsLabel)

        postLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 46).isActive = true
        folowersLabel.leadingAnchor.constraint(equalTo: postLabel.trailingAnchor)
            .isActive = true
        subscriptionsLabel.leadingAnchor.constraint(equalTo: folowersLabel.trailingAnchor)
            .isActive = true

        postLabel.text = AppConstants.post
        folowersLabel.text = AppConstants.followers
        subscriptionsLabel.text = AppConstants.subscriptions
    }

    private func configureUserDescription() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor, constant: 11).isActive = true
        // descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func configButton(nameButton: UIButton, text: String) {
        contentView.addSubview(nameButton)
        nameButton.backgroundColor = #colorLiteral(red: 0.9499530196, green: 0.9499530196, blue: 0.9499530196, alpha: 1)
        nameButton.layer.cornerRadius = 8
        nameButton.setTitle(text, for: .normal)
        nameButton.setTitleColor(.black, for: .normal)
        nameButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        nameButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        nameButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 38).isActive = true
        nameButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    func setupButton() {
        configButton(nameButton: changeButton, text: AppConstants.change)
        configButton(nameButton: shareButton, text: AppConstants.share)

        changeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5).isActive = true
    }

    private func configButton() {
        contentView.addSubview(plusButton)
        plusButton.backgroundColor = #colorLiteral(red: 0.9499530196, green: 0.9499530196, blue: 0.9499530196, alpha: 1)
        plusButton.layer.cornerRadius = 8
        plusButton.setImage(UIImage(named: AppConstants.shareImageName), for: .normal)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 5).isActive = true
    }
}
