// NotificationSubscription.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Ячейка с кнопкой "Подписаться"
struct NotificationSubscription: NotificationProtocol {
    // Тип ячейки
    var cellType: NotificationTypes = .subscription

    // Фото пользователя
    var avatarName: String
    // Никнейм пользователя
    var userName: String
    // Описание действия пользователя
    var userAction: String
    // Время выполнения действия пользователя
    var notificationTime: String?
    // Кнопка справа с действием "Подписаться"
    var buttonRight: String
}
