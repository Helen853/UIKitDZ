// Notification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// MARK: - Types

// Модель для ячейки с комментарием
struct NotificationComment: NotificationProtocol {
    // тип ячейки
    var cellType: NotificationTypes = .comment

    // Фото пользователя
    var avatarName: String
    // Никнейм пользователя
    var nameUser: String
    // Описание действия пользователя
    var actionUser: String
    // Время выполнения действия пользователя
    var timeAction: String?
    // Имя картинки с которой взаимодействовал пользователь
    var nameImage: String
}

// Модель для ячейки с кнопкой "Подписаться"
struct NotificationSubscription: NotificationProtocol {
    // Тип ячейки
    var cellType: NotificationTypes = .subscription

    // Фото пользователя
    var avatarName: String
    // Никнейм пользователя
    var nameUser: String
    // Описание действия пользователя
    var actionUser: String
    // Время выполнения действия пользователя
    var timeAction: String?
    // Кнопка справа с действием "Подписаться"
    var rightAction: String
}

// Енам для типов ячеек
enum NotificationTypes {
    case comment
    case subscription
}

protocol NotificationProtocol {
    var cellType: NotificationTypes { get }
    var timeAction: String? { get }
}
