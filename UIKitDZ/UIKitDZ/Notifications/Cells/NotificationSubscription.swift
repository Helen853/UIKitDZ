//
//  NotificationSubscription.swift
//  UIKitDZ
//
//  Created by Киса Мурлыса on 21.02.2024.
//

import Foundation

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
    var notificationTime: String?
    // Кнопка справа с действием "Подписаться"
    var buttonRight: String
}
