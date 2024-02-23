// NotificationComment.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Ячейка с комментарием
struct NotificationComment: NotificationProtocol {
    // тип ячейки
    var cellType: NotificationTypes = .comment
    // Фото пользователя
    var avatarName: String
    // Никнейм пользователя
    var userName: String
    // Описание действия пользователя
    var userActionText: String
    // Время выполнения действия пользователя
    var notificationTime: String?
    // Имя картинки с которой взаимодействовал пользователь
    var imageName: String
}
