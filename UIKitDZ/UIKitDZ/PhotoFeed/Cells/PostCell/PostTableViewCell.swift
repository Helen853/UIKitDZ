// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Ячейка с опубликовонном постом
final class PostTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let avatarImageView = UIImageView()
    private let nameUserLabel = UILabel()

    private let postImageView = UIImageView()
    private let secondPageImageView = UIImageView()
    private let thirdPageImageView = UIImageView()

    private let discriptionLabel = UILabel()
    private let ellipsesLabel = UILabel()
    private let likeLabel = UILabel()
    private let dicriptionLabel = UILabel()
    private let commentedLabel = UILabel()
    private let publicationTimeLabel = UILabel()

    private let avatarUserImageView = UIImageView()
    private let likeImageView = UIImageView()
    private let commentImageView = UIImageView()
    private let sendImageView = UIImageView()
    private let saveImageView = UIImageView()

    private let pageControll = UIPageControl()
    private let scrollView = UIScrollView()

    private lazy var picturePages = [postImageView, secondPageImageView, thirdPageImageView]

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configAvatar()
        configNickName()
        configScroll()
        setupActionImage()
        configLikeLabel()
        configDiscription()
        configAvatarUser()
        configCommentLabel()
        confugPublicationTime()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configCell(model: Post) {
        avatarImageView.image = UIImage(named: model.avatarImage)
        nameUserLabel.text = model.nameUser
        postImageView.image = UIImage(named: model.postImage)
        likeImageView.image = UIImage(named: model.likeImage)
        commentImageView.image = UIImage(named: model.commentImage)
        sendImageView.image = UIImage(named: model.sendImage)
        saveImageView.image = UIImage(named: model.saveImage)
        likeLabel.text = model.likeTitle
        dicriptionLabel.text = model.discription
        avatarUserImageView.image = UIImage(named: model.avatarUser)
        commentedLabel.text = model.commented
        publicationTimeLabel.text = model.publicationTime

        guard model.pages.count > 1 else { return }
        secondPageImageView.image = UIImage(named: model.pages[1])
        thirdPageImageView.image = UIImage(named: model.pages[2])
        configPage()
    }

    // MARK: - Private Methods

    private func configAvatar() {
        contentView.addSubview(avatarImageView)
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 15
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    }

    private func configNickName() {
        contentView.addSubview(nameUserLabel)
        nameUserLabel.textAlignment = .center
        nameUserLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        nameUserLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUserLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        nameUserLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameUserLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor).isActive = true
        nameUserLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    }

    private func configPostImage(nameImage: UIImageView) {
        scrollView.addSubview(nameImage)
        nameImage.translatesAutoresizingMaskIntoConstraints = false
        nameImage.widthAnchor.constraint(equalToConstant: 375).isActive = true
        nameImage.heightAnchor.constraint(equalToConstant: 239).isActive = true
        nameImage.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        nameImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    private func configActionImage(nameImageView: UIImageView, width: CGFloat, hight: CGFloat) {
        contentView.addSubview(nameImageView)
        nameImageView.translatesAutoresizingMaskIntoConstraints = false
        nameImageView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 11).isActive = true
        nameImageView.heightAnchor.constraint(equalToConstant: hight).isActive = true
        nameImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func setupActionImage() {
        configActionImage(nameImageView: likeImageView, width: 18, hight: 16)
        likeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        configActionImage(nameImageView: commentImageView, width: 19, hight: 19)
        commentImageView.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 11).isActive = true
        configActionImage(nameImageView: sendImageView, width: 17, hight: 17)
        sendImageView.leadingAnchor.constraint(equalTo: commentImageView.trailingAnchor, constant: 12).isActive = true
        configActionImage(nameImageView: saveImageView, width: 14, hight: 18)
        saveImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14).isActive = true
    }

    private func configLikeLabel() {
        contentView.addSubview(likeLabel)
        likeLabel.textColor = .black
        likeLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        likeLabel.topAnchor.constraint(equalTo: likeImageView.bottomAnchor, constant: 6).isActive = true
    }

    private func configDiscription() {
        contentView.addSubview(dicriptionLabel)
        dicriptionLabel.textColor = .black
        dicriptionLabel.font = UIFont.systemFont(ofSize: 10)
        dicriptionLabel.numberOfLines = 2
        dicriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dicriptionLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        dicriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dicriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        dicriptionLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 6).isActive = true
    }

    private func configAvatarUser() {
        contentView.addSubview(avatarUserImageView)
        avatarUserImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarUserImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        avatarUserImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        avatarUserImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarUserImageView.topAnchor.constraint(equalTo: dicriptionLabel.bottomAnchor, constant: 4).isActive = true
    }

    private func configCommentLabel() {
        contentView.addSubview(commentedLabel)
        commentedLabel.textColor = #colorLiteral(red: 0.6321665049, green: 0.6357643008, blue: 0.6358397603, alpha: 1)
        commentedLabel.font = UIFont.systemFont(ofSize: 10)
        commentedLabel.translatesAutoresizingMaskIntoConstraints = false
        commentedLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commentedLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        commentedLabel.leadingAnchor.constraint(equalTo: avatarUserImageView.trailingAnchor, constant: 3)
            .isActive = true
        commentedLabel.topAnchor.constraint(equalTo: dicriptionLabel.bottomAnchor, constant: 6).isActive = true
    }

    private func confugPublicationTime() {
        contentView.addSubview(publicationTimeLabel)
        publicationTimeLabel.textColor = #colorLiteral(red: 0.6321665049, green: 0.6357643008, blue: 0.6358397603, alpha: 1)
        publicationTimeLabel.font = UIFont.systemFont(ofSize: 10)
        publicationTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        publicationTimeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        publicationTimeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        publicationTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        publicationTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        publicationTimeLabel.topAnchor.constraint(equalTo: commentedLabel.bottomAnchor, constant: 7).isActive = true
    }

    private func configScroll() {
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        configPostImage(nameImage: postImageView)
        configPostImage(nameImage: secondPageImageView)
        configPostImage(nameImage: thirdPageImageView)

        postImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        secondPageImageView.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor).isActive = true
        thirdPageImageView.leadingAnchor.constraint(equalTo: secondPageImageView.trailingAnchor).isActive = true
        thirdPageImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    }

    private func configPage() {
        contentView.addSubview(pageControll)
        pageControll.numberOfPages = picturePages.count
        pageControll.pageIndicatorTintColor = .gray
        pageControll.currentPageIndicatorTintColor = .black
        pageControll.addTarget(self, action: #selector(showNextImage), for: .valueChanged)
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        pageControll.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 18).isActive = true
        pageControll.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }

    @objc private func showNextImage() {
        let ofsetX = UIScreen.main.bounds.width * CGFloat(pageControll.currentPage)
        scrollView.setContentOffset(CGPoint(x: ofsetX, y: 0), animated: true)
    }
}
