// NotificationSubscriptionTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка уведомлений с кнопкой "подписаться"
final class NotificationSubscriptionTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let avatarImageView = UIImageView()
    private let commentLabel = UILabel()
    private let subscriptionButton = UIButton()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAvatar()
        configureLabel()
        configureButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configureCell(model: NotificationSubscription) {
        avatarImageView.image = UIImage(named: model.avatarName)
        let timeAction = NSAttributedString(
            string: model.notificationTime ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        let boldAttributed = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)]
        let comment = NSMutableAttributedString(string: model.actionUser)
        let allText = NSMutableAttributedString(string: model.nameUser, attributes: boldAttributed)
        allText.append(comment)
        allText.append(timeAction)
        commentLabel.attributedText = allText
        subscriptionButton.setTitle(model.buttonRight, for: .normal)
    }

    // MARK: - Private Methods

    private func configureAvatar() {
        contentView.addSubview(avatarImageView)
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 15
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }

    private func configureLabel() {
        contentView.addSubview(commentLabel)
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.numberOfLines = 3
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.widthAnchor.constraint(equalToConstant: 154).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func configureButton() {
        contentView.addSubview(subscriptionButton)
        subscriptionButton.setTitleColor(.white, for: .normal)
        subscriptionButton.backgroundColor = #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1)
        subscriptionButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        subscriptionButton.layer.cornerRadius = 8
        subscriptionButton.translatesAutoresizingMaskIntoConstraints = false
        subscriptionButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscriptionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscriptionButton.leadingAnchor.constraint(equalTo: commentLabel.trailingAnchor, constant: 9).isActive = true
        subscriptionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13).isActive = true
        subscriptionButton.addTarget(self, action: #selector(changeButton), for: .touchUpInside)
    }

    @objc private func changeButton() {
        subscriptionButton.backgroundColor = #colorLiteral(red: 0.984447062, green: 0.9844469428, blue: 0.9844469428, alpha: 1)
        subscriptionButton.layer.borderColor = UIColor.gray.cgColor
        subscriptionButton.layer.borderWidth = 1
        subscriptionButton.setTitleColor(.lightGray, for: .normal)
        subscriptionButton.setTitle(AppConstants.buttonTitle, for: .normal)
    }
}
