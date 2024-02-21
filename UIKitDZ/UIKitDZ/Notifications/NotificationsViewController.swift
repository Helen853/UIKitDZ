// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений
final class NotificationsViewController: UIViewController {
    
    enum Sections {
        case today
        case otherDay
    }
    
    // MARK: - Visual Components

    private let titleLabel = UILabel()
    private let requestLabel = UILabel()
    private let tableView = UITableView()
    private let todayHeaderLabel = UILabel()
    private let weekHeaderLabel = UILabel()
    private let today = Sections.today
    private let otherDay = Sections.otherDay

    // Массив с моделями ячеек
    private var notifications: [NotificationProtocol] = [
        NotificationComment(
            avatarName: AppConstants.avatarLavanda,
            userName: AppConstants.lavandaUser,
            userActionText: AppConstants.commentText,
            notificationTime: AppConstants.time,
            imageName: AppConstants.see
        ),
        NotificationComment(
            avatarName: AppConstants.avatarLavanda,
            userName: AppConstants.lavandaUser,
            userActionText: AppConstants.commentFirst,
            notificationTime: AppConstants.time,
            imageName: AppConstants.see
        ),
        NotificationComment(
            avatarName: AppConstants.avatarLavanda,
            userName: AppConstants.lavandaUser,
            userActionText: AppConstants.commentSecond,
            notificationTime: AppConstants.threeDays,
            imageName: AppConstants.lobi
        ),
        NotificationSubscription(
            avatarName: AppConstants.avatarMiho,
            userName: AppConstants.mihoUser,
            userAction: AppConstants.commentThird,
            notificationTime: AppConstants.threeDays,
            buttonRight: AppConstants.subscribeText
        ),
        NotificationSubscription(
            avatarName: AppConstants.avatarLavanda,
            userName: AppConstants.lavandaUser,
            userAction: AppConstants.commentFive,
            notificationTime: AppConstants.fiveDays,
            buttonRight: AppConstants.subscribeText
        ),
        NotificationComment(
            avatarName: AppConstants.avatarLavanda,
            userName: AppConstants.lavandaUser,
            userActionText: AppConstants.commentFourth,
            notificationTime: AppConstants.sevendays,
            imageName: AppConstants.lobi
        ),
        NotificationSubscription(
            avatarName: AppConstants.avatarMark,
            userName: AppConstants.markUser,
            userAction: AppConstants.commentThird,
            notificationTime: AppConstants.eightDays,
            buttonRight: AppConstants.subscribeText
        ),
        NotificationSubscription(
            avatarName: AppConstants.avatarNeit,
            userName: AppConstants.neitUser,
            userAction: AppConstants.commentThird,
            notificationTime: AppConstants.eightDays,
            buttonRight: AppConstants.subscribeText
        )
    ]
    
    private lazy var sections: [Sections] = [today, otherDay]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureRequestTitle()
        configureTable()
        registerCell()
    }

    // MARK: - Private Methods

    private func configureTitle() {
        navigationItem.title = AppConstants.notificationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureRequestTitle() {
        view.addSubview(requestLabel)
        requestLabel.text = AppConstants.requestTitle
        requestLabel.font = UIFont.systemFont(ofSize: 14)
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.widthAnchor.constraint(equalToConstant: 251).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        requestLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        requestLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }

    private func configureTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 144
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 5).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func configTodayHeader() {
        todayHeaderLabel.text = AppConstants.todayHeader
        todayHeaderLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        todayHeaderLabel.textColor = .black
    }

    private func configWeekHeader() {
        weekHeaderLabel.text = AppConstants.thisWeekHeader
        weekHeaderLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        weekHeaderLabel.textColor = .black
    }

    private func registerCell() {
        tableView.register(
            NotificationCommentTableViewCell.self,
            forCellReuseIdentifier: AppConstants.commentIdentifier
        )
        tableView.register(
            NotificationSubscriptionTableViewCell.self,
            forCellReuseIdentifier: AppConstants.SubscriptionIdentifier
        )
    }
}

// MARK: - Extension UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let todayNotification = notifications.filter {
            guard
                let actionTime = $0.notificationTime,
                actionTime == " 12 ч"
            else { return false }

            return true
        }

        let anohterNotification = notifications.filter {
            guard
                let actionTime = $0.notificationTime,
                actionTime != " 12 ч"
            else { return false }

            return true
        }
        
        switch sections[section] {
        case .today:
            return todayNotification.count
        case .otherDay:
            return anohterNotification.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Делаем массивы моделек в которых лежат или "12 ч" посты, или иные.
        let todayNotification = notifications.filter {
            guard
                let actiontime = $0.notificationTime,
                actiontime == " 12 ч"
            else { return false }

            return true
        }

        let anohterPost = notifications.filter {
            guard
                let actiontime = $0.notificationTime,
                actiontime != " 12 ч"
            else { return false }

            return true
        }

        /// Метод возвращает ячейку по модельке. Передаем в него массив ИЛИ 12 часовых моделек, или иных
        func getCell(models: [NotificationProtocol]) -> UITableViewCell {
            /// Получаем тип модельки. Он зашит в протокол
            let cellType = models[indexPath.row].cellType

            /// Получаем кастомную ячейку конкретного типа
            switch cellType {
            case .comment:
                guard
                    let cell = tableView
                    .dequeueReusableCell(
                        withIdentifier: AppConstants
                            .commentIdentifier
                    ) as? NotificationCommentTableViewCell,
                    let model = models[indexPath.row] as? NotificationComment
                else {
                    return UITableViewCell()
                }
                cell.configureCell(model: model)
                return cell
            case .subscription:
                guard
                    let cell = tableView
                    .dequeueReusableCell(
                        withIdentifier: AppConstants
                            .SubscriptionIdentifier
                    ) as? NotificationSubscriptionTableViewCell,
                    let model = models[indexPath.row] as? NotificationSubscription
                else {
                    return UITableViewCell()
                }
                cell.configureCell(model: model)
                return cell
            }
        }

        /// Временная ячейка для возврата
        var baseCell = UITableViewCell()

        /// В зависимости от того какая это секция - 12 часовая или иная мы передаем в метод getCell соответствующий
        /// массив моделек
        switch indexPath.section {
        case 0:
            baseCell = getCell(models: todayNotification)
        case 1:
            baseCell = getCell(models: anohterPost)
        default:
            baseCell = UITableViewCell()
        }

        /// Возвращаем ячейку готовую и настроенную
        return baseCell
    }

    // Удаление ячейки
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        notifications.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

// MARK: - Extension UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    // Настраиваем хэдэр для секций
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            configTodayHeader()
            return todayHeaderLabel
        case 1:
            configWeekHeader()
            return weekHeaderLabel
        default:
            return nil
        }
    }

    // Расстояние между секциями
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
}
