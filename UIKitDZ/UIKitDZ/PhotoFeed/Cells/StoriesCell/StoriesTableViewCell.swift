// StoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка отображающая истории пользователей
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let nameLabel = UILabel()

    private let avatarImageView = UIImageView()
    private let avatarStoriesImageView = UIImageView()
    private let avatar2StoriesImageView = UIImageView()
    private let avatar3StoriesImageView = UIImageView()
    private let avatar4StoriesImageView = UIImageView()
    private let nameUserLabel = UILabel()
    private let secondNameUserLabel = UILabel()
    private let thirdNameUserLabel = UILabel()
    private let fourthNameUserLabel = UILabel()

    private let plusLabel = UILabel()

    private let scrollView = UIScrollView()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configAvatar()
        configLabel()
        setupAvatarStories()
        configScroll()
        configPlus()
        configNameUser()
        setupNameUser()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configCell(model: Stories) {
        nameLabel.text = model.nameLabel
        avatarImageView.image = UIImage(named: model.nameImage)
        let storiesArray = [
            avatarStoriesImageView,
            avatar2StoriesImageView,
            avatar3StoriesImageView,
            avatar4StoriesImageView
        ]
        storiesArray.forEach { $0.image = UIImage(named: model.avatarLavanda) }

        let names = [nameUserLabel, secondNameUserLabel, thirdNameUserLabel, fourthNameUserLabel]
        names.forEach { $0.text = model.nameUser }
    }

    // MARK: - Private Methods

    private func configNameUser() {
        scrollView.addSubview(nameUserLabel)
        nameUserLabel.font = UIFont.systemFont(ofSize: 8)
        nameUserLabel.textColor = .black
        nameUserLabel.textAlignment = .center
        nameUserLabel.translatesAutoresizingMaskIntoConstraints = false

        nameUserLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        nameUserLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameUserLabel.centerXAnchor.constraint(equalTo: avatarStoriesImageView.centerXAnchor).isActive = true
        nameUserLabel.topAnchor.constraint(equalTo: avatarStoriesImageView.bottomAnchor, constant: -6).isActive = true
    }

    private func configAllNameUser(nameUser: UILabel, avatar: UIImageView) {
        scrollView.addSubview(nameUser)
        nameUser.font = UIFont.systemFont(ofSize: 8)
        nameUser.textColor = .black
        nameUser.textAlignment = .center
        nameUser.translatesAutoresizingMaskIntoConstraints = false

        nameUser.widthAnchor.constraint(equalToConstant: 74).isActive = true
        nameUser.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameUser.centerXAnchor.constraint(equalTo: avatar.centerXAnchor).isActive = true
        nameUser.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -6).isActive = true
    }

    private func setupNameUser() {
        configAllNameUser(nameUser: secondNameUserLabel, avatar: avatar2StoriesImageView)
        configAllNameUser(nameUser: thirdNameUserLabel, avatar: avatar3StoriesImageView)
        configAllNameUser(nameUser: fourthNameUserLabel, avatar: avatar4StoriesImageView)
    }

    private func configPlus() {
        scrollView.addSubview(plusLabel)
        plusLabel.backgroundColor = #colorLiteral(red: 0.9401339889, green: 0.3725178838, blue: 0.4427154064, alpha: 1)
        plusLabel.layer.masksToBounds = true
        plusLabel.layer.cornerRadius = 10
        plusLabel.text = AppConstants.plus
        plusLabel.textAlignment = .center
        plusLabel.textColor = .white

        plusLabel.translatesAutoresizingMaskIntoConstraints = false
        plusLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        plusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        plusLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 52).isActive = true
        plusLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
    }

    private func configAvatar() {
        scrollView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor, constant: 10).isActive = true
    }

    private func convigAvatarStories(nameAvatar: UIImageView, left: CGFloat) {
        scrollView.addSubview(nameAvatar)
        nameAvatar.translatesAutoresizingMaskIntoConstraints = false
        nameAvatar.layer.cornerRadius = 30
        nameAvatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nameAvatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nameAvatar.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: left).isActive = true
        nameAvatar.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        nameAvatar.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    private func setupAvatarStories() {
        convigAvatarStories(nameAvatar: avatarStoriesImageView, left: 94)
        convigAvatarStories(nameAvatar: avatar2StoriesImageView, left: 176)
        convigAvatarStories(nameAvatar: avatar3StoriesImageView, left: 258)
        convigAvatarStories(nameAvatar: avatar4StoriesImageView, left: 340)
        avatar4StoriesImageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -12).isActive = true
    }

    private func configLabel() {
        scrollView.addSubview(nameLabel)
        nameLabel.font = UIFont.systemFont(ofSize: 8)
        nameLabel.textColor = #colorLiteral(red: 0.6321665049, green: 0.6357643008, blue: 0.6358397603, alpha: 1)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        scrollView.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor, constant: 10).isActive = true
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
}
