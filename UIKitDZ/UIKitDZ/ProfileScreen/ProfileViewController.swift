// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Visual Components

    private let leftItemImageView = UIImageView()
    private let rightItemImageView = UIImageView()
    private let secondRightItemImageView = UIImageView()
    private let leftItemLabel = UILabel()
    private let tableView = UITableView()
    private let cellModels: [ProfileInfoProtocol] = [
        ProfileInfo(
            avatarName: AppConstants.nameAvatar,
            userName: AppConstants.surname,
            countPost: AppConstants.countPost,
            countFollowers: AppConstants.countFollowers,
            countsubscriptions: AppConstants.countsubscriptions,
            description: AppConstants.consultant
        ),
        CurrentStories(
            imageLaunch: AppConstants.launch,
            imageMoon: AppConstants.moon,
            imageAstronaut: AppConstants.astronaut,
            imageSpace: AppConstants.space
        ),
        Photo(photos: [
            AppConstants.lights,
            AppConstants.earth,
            AppConstants.rocket,
            AppConstants.takeoff,
            AppConstants.lights,
            AppConstants.earth,
            AppConstants.rocket,
            AppConstants.takeoff,
            AppConstants.rocket,
            AppConstants.takeoff,
            AppConstants.lights,
            AppConstants.earth
        ])
    ]

    // MARK: - Public Properties

    var showSpacexHandler: (() -> Void)?
    var showStoriesHandler: (() -> Void)?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTable()
        registerCell()
        showSpacex()
        showStories()
    }

    // MARK: - Private Methods

    private func showSpacex() {
        showSpacexHandler = { [weak self] in
            guard let self = self else { return }
            let spacexViewController = SpacexViewController()
            spacexViewController.modalPresentationStyle = .fullScreen
            present(spacexViewController, animated: true, completion: nil)
        }
    }

    private func showStories() {
        showStoriesHandler = { [weak self] in
            guard let self = self else { return }
            let storiesViewController = StoriesViewController()
            storiesViewController.modalPresentationStyle = .fullScreen
            present(storiesViewController, animated: true, completion: nil)
        }
    }

    private func configureNavigationBar() {
        leftItemImageView.image = UIImage(named: AppConstants.lock)
        rightItemImageView.image = UIImage(named: AppConstants.line)
        secondRightItemImageView.image = UIImage(named: AppConstants.plusRight)
        leftItemLabel.text = AppConstants.profileTitle
        leftItemLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        let rightButtonItem = UIBarButtonItem(customView: rightItemImageView)
        let secondRightButtonItem = UIBarButtonItem(customView: secondRightItemImageView)
        let secondLeftButtonItem = UIBarButtonItem(customView: leftItemLabel)
        let leftButtonItem = UIBarButtonItem(customView: leftItemImageView)
        navigationItem.setRightBarButtonItems([rightButtonItem, secondRightButtonItem], animated: true)
        navigationItem.setLeftBarButtonItems([leftButtonItem, secondLeftButtonItem], animated: true)
    }

    private func configureTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func registerCell() {
        tableView.register(
            ProfileInfoTableViewCell.self,
            forCellReuseIdentifier: AppConstants.infoIdentifier
        )
        tableView.register(
            СurrentStoriesTableViewCell.self,
            forCellReuseIdentifier: AppConstants.currentStoriesIdentifier
        )
        tableView.register(
            PhotoTableViewCell.self,
            forCellReuseIdentifier: AppConstants.photoIdentifier
        )
    }
}

// MARK: - Extension UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellModels[indexPath.row].cellType

        switch cellType {
        case .info:
            guard
                let cell = tableView
                .dequeueReusableCell(withIdentifier: AppConstants.infoIdentifier) as? ProfileInfoTableViewCell,
                let model = cellModels[indexPath.row] as? ProfileInfo
            else {
                return UITableViewCell()
            }
            cell.configureCell(model: model, tapOnButton: showSpacexHandler)
            return cell
        case .stories:
            guard
                let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: AppConstants
                        .currentStoriesIdentifier
                ) as? СurrentStoriesTableViewCell,
                let model = cellModels[indexPath.row] as? CurrentStories
            else {
                return UITableViewCell()
            }
            cell.configureCell(model: model, tapStories: showStoriesHandler)
            return cell
        case .photo:
            guard
                let cell = tableView
                .dequeueReusableCell(withIdentifier: AppConstants.photoIdentifier) as? PhotoTableViewCell,
                let model = cellModels[indexPath.row] as? Photo
            else {
                return UITableViewCell()
            }
            cell.configureCell(model: model)
            return cell
        }
    }
}
