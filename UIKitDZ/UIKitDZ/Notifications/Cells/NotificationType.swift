// NotificationModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол предоставляет информацию о типе модели и времени уведомления
protocol NotificationProtocol {
    var cellType: NotificationTypes { get }
    var notificationTime: String? { get }
}

// Енам для типов ячеек
enum NotificationTypes {
    case comment
    case subscription
}
