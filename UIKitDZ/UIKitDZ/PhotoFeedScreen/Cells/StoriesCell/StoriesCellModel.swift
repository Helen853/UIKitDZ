// StoriesCellModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сторис
struct Stories: CellTypeProtocol {
    /// Тип ячейки
    let cellType: TableCellsTypes = .stories
    /// Аватар пользователя
    let imageName: String
    /// Текст под историей
    let labelName: String
    /// Аватарка сториз пользователя
    let avatarStoriesName: String
    /// Имя пользователя
    let userName: String
}
