// PhotoFeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран  ленты с фото
final class PhotoFeedViewController: UIViewController {
    // MARK: - Visual Components

    private let leftItemImageView = UIImageView()
    private let rightItemImageView = UIImageView()
    private let tableView = UITableView()

    // Массив моделей ячеек
    private let cellModels: [CellTypeProtocol] = [
        Stories(
            imageName: AppConstants.nameAvatar,
            labelName: AppConstants.nameStories,
            avatarStoriesName: AppConstants.avatarLavanda, userName: AppConstants.lavandaUser
        ),
        Post(
            avatarName: AppConstants.avatarHourse,
            userName: AppConstants.nameUser,
            imageForPostName: AppConstants.postImage,
            discriptionPost: AppConstants.discription,
            likeImageName: AppConstants.likeImage,
            commentImageName: AppConstants.commentImage,
            sendImageName: AppConstants.sendImage,
            saveImageName: AppConstants.saveImage,
            likeCount: AppConstants.countLike,
            userAvatarName: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            imagePages: [AppConstants.postImage, AppConstants.secondPage, AppConstants.thirdPage]
        ),
        Recommend(
            imageName: AppConstants.nameImage,
            userName: AppConstants.nameUserReccomend,
            title: AppConstants.titleReccomend,
            rightTitle: AppConstants.rightTitle,
            buttonTitle: AppConstants.subscribeText,
            secondAvatar: AppConstants.secondAvatar,
            secondUserName: AppConstants.secondNameUser
        ),
        Post(
            avatarName: AppConstants.avatarHourse,
            userName: AppConstants.nameUser,
            imageForPostName: AppConstants.postImage,
            discriptionPost: AppConstants.discription,
            likeImageName: AppConstants.likeImage,
            commentImageName: AppConstants.commentImage,
            sendImageName: AppConstants.sendImage,
            saveImageName: AppConstants.saveImage,
            likeCount: AppConstants.countLike,
            userAvatarName: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            imagePages: [AppConstants.postImage]
        ),
        Post(
            avatarName: AppConstants.avatarHourse,
            userName: AppConstants.nameUser,
            imageForPostName: AppConstants.postImage,
            discriptionPost: AppConstants.discription,
            likeImageName: AppConstants.likeImage,
            commentImageName: AppConstants.commentImage,
            sendImageName: AppConstants.sendImage,
            saveImageName: AppConstants.saveImage,
            likeCount: AppConstants.countLike,
            userAvatarName: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            imagePages: [AppConstants.postImage]
        ),
        Post(
            avatarName: AppConstants.avatarHourse,
            userName: AppConstants.nameUser,
            imageForPostName: AppConstants.postImage,
            discriptionPost: AppConstants.discription,
            likeImageName: AppConstants.likeImage,
            commentImageName: AppConstants.commentImage,
            sendImageName: AppConstants.sendImage,
            saveImageName: AppConstants.saveImage,
            likeCount: AppConstants.countLike,
            userAvatarName: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            imagePages: [AppConstants.postImage]
        )
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        registerCell()
        configureTable()
    }

    // MARK: - Private Methods

    private func configureTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 144
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.separatorStyle = .none
    }

    private func configureNavigationBar() {
        leftItemImageView.image = UIImage(named: AppConstants.nameImageLeftItem)
        rightItemImageView.image = UIImage(named: AppConstants.nameImageRightItem)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItemImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItemImageView)
    }

    private func registerCell() {
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: AppConstants.storiesIdentifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: AppConstants.postIdentifier)
        tableView.register(RecommendTableViewCell.self, forCellReuseIdentifier: AppConstants.recommendIdentifier)
    }
}

extension PhotoFeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellModels.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellModels[indexPath.row].cellType

        switch cellType {
        case .stories:
            guard
                let cell = tableView
                .dequeueReusableCell(withIdentifier: AppConstants.storiesIdentifier) as? StoriesTableViewCell,
                let model = cellModels[indexPath.row] as? Stories
            else {
                return UITableViewCell()
            }
            cell.configureCell(model: model)
            return cell
        case .post:
            guard
                let cell = tableView
                .dequeueReusableCell(withIdentifier: AppConstants.postIdentifier) as? PostTableViewCell,
                let model = cellModels[indexPath.row] as? Post
            else {
                return UITableViewCell()
            }
            cell.configureCell(model: model)
            return cell
        case .recomendation:
            guard
                let cell = tableView
                .dequeueReusableCell(withIdentifier: AppConstants.recommendIdentifier) as? RecommendTableViewCell,
                let model = cellModels[indexPath.row] as? Recommend
            else {
                return UITableViewCell()
            }
            cell.configureCell(model: model)
            return cell
        }
    }
}
