//
//  NotificationComment.swift
//  UIKitDZ
//
//  Created by Киса Мурлыса on 21.02.2024.
//

import Foundation

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
    var notificationTime: String?
    // Имя картинки с которой взаимодействовал пользователь
    var nameImage: String
}
