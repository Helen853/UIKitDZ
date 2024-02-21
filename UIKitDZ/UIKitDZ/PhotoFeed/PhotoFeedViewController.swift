// PhotoFeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображающий ленту с фото
final class PhotoFeedViewController: UIViewController {
    // MARK: - Visual Components

    private let leftItemImageView = UIImageView()
    private let rightItemImageView = UIImageView()

    private let tableView = UITableView()

    // Массив моделей ячеек
    private let cellModels: [CellTypeProtocol] = [
        Stories(
            nameImage: AppConstants.nameAvatar,
            nameLabel: AppConstants.nameStories,
            avatarLavanda: AppConstants.avatarLavanda, nameUser: AppConstants.lavandaUser
        ),
        Post(
            avatarImage: AppConstants.avatarHourse,
            nameUser: AppConstants.nameUser,
            postImage: AppConstants.postImage,
            discription: AppConstants.discription,
            likeImage: AppConstants.likeImage,
            commentImage: AppConstants.commentImage,
            sendImage: AppConstants.sendImage,
            saveImage: AppConstants.saveImage,
            likeTitle: AppConstants.countLike,
            avatarUser: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            pages: [AppConstants.postImage, AppConstants.secondPage, AppConstants.thirdPage]
        ),
        Recommend(
            nameImage: AppConstants.nameImage,
            nameUser: AppConstants.nameUserReccomend,
            title: AppConstants.titleReccomend,
            allText: AppConstants.rightTitle,
            titleButton: AppConstants.subscribeText,
            secondAvatar: AppConstants.secondAvatar,
            secondNameUser: AppConstants.secondNameUser
        ),
        Post(
            avatarImage: AppConstants.avatarHourse,
            nameUser: AppConstants.nameUser,
            postImage: AppConstants.postImage,
            discription: AppConstants.discription,
            likeImage: AppConstants.likeImage,
            commentImage: AppConstants.commentImage,
            sendImage: AppConstants.sendImage,
            saveImage: AppConstants.saveImage,
            likeTitle: AppConstants.countLike,
            avatarUser: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            pages: [AppConstants.postImage]
        ),
        Post(
            avatarImage: AppConstants.avatarHourse,
            nameUser: AppConstants.nameUser,
            postImage: AppConstants.postImage,
            discription: AppConstants.discription,
            likeImage: AppConstants.likeImage,
            commentImage: AppConstants.commentImage,
            sendImage: AppConstants.sendImage,
            saveImage: AppConstants.saveImage,
            likeTitle: AppConstants.countLike,
            avatarUser: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            pages: [AppConstants.postImage]
        ),
        Post(
            avatarImage: AppConstants.avatarHourse,
            nameUser: AppConstants.nameUser,
            postImage: AppConstants.postImage,
            discription: AppConstants.discription,
            likeImage: AppConstants.likeImage,
            commentImage: AppConstants.commentImage,
            sendImage: AppConstants.sendImage,
            saveImage: AppConstants.saveImage,
            likeTitle: AppConstants.countLike,
            avatarUser: AppConstants.nameAvatar,
            commented: AppConstants.commented,
            publicationTime: AppConstants.publicationTime,
            pages: [AppConstants.postImage]
        )
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        registerCell()
        configTable()
    }

    // MARK: - Private Methods

    private func configTable() {
        view.addSubview(tableView)
        tableView.delegate = self
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

    private func configNavigationBar() {
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

extension PhotoFeedViewController: UITableViewDataSource, UITableViewDelegate {
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
            cell.configCell(model: model)
            return cell
        case .post:
            guard
                let cell = tableView
                .dequeueReusableCell(withIdentifier: AppConstants.postIdentifier) as? PostTableViewCell,
                let model = cellModels[indexPath.row] as? Post
            else {
                return UITableViewCell()
            }
            cell.configCell(model: model)
            return cell
        case .recomendation:
            guard
                let cell = tableView
                .dequeueReusableCell(withIdentifier: AppConstants.recommendIdentifier) as? RecommendTableViewCell,
                let model = cellModels[indexPath.row] as? Recommend
            else {
                return UITableViewCell()
            }
            cell.configCell(model: model)
            return cell
        }
    }
}
