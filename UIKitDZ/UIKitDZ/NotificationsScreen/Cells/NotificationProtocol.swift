// NotificationProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Общий протокол для объектов которые могут выступать в качестве нотификаций
protocol NotificationProtocol {
    /// Тип уведомлений
    var cellType: NotificationTypes { get }
    /// Время уведомлений
    var notificationTime: String? { get }
}
