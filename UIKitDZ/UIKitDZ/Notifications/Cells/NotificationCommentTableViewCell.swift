// NotificationCommentTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка уведомлений с комментарием
final class NotificationCommentTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let avatarImageView = UIImageView()
    private let commentLabel = UILabel()
    private let pictureImageView = UIImageView()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configAvatar()
        configLabel()
        configPicture()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configCell(model: NotificationComment) {
        avatarImageView.image = UIImage(named: model.avatarName)
        let timeAction = NSAttributedString(
            string: model.timeAction ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        let boldAttributed = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)]
        let comment = NSMutableAttributedString(string: model.actionUser)
        let allText = NSMutableAttributedString(string: model.nameUser, attributes: boldAttributed)
        allText.append(comment)
        allText.append(timeAction)
        commentLabel.attributedText = allText
        pictureImageView.image = UIImage(named: model.nameImage)
    }

    // MARK: - Private Methods

    private func configAvatar() {
        contentView.addSubview(avatarImageView)
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 15
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }

    private func configLabel() {
        contentView.addSubview(commentLabel)
        commentLabel.font = UIFont.systemFont(ofSize: 12)
        commentLabel.numberOfLines = 2
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
    }

    private func configPicture() {
        contentView.addSubview(pictureImageView)
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        pictureImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pictureImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        pictureImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
