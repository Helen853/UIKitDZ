// PostCellModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Пост
struct Post: CellTypeProtocol {
    /// Тип ячейки
    var cellType: TableCellsTypes = .post
    /// Аватарка пользователя сделавшего публикацию
    var avatarName: String
    /// Имя пользователя
    var userName: String
    /// Картинка для поста
    var imageForPostName: String
    /// Описание под постом
    var discriptionPost: String
    /// Картинка для лайка
    var likeImageName: String
    /// Картинка для комментария
    var commentImageName: String
    /// Картинка отправки поста
    var sendImageName: String
    /// Картинка для сохранения поста
    var saveImageName: String
    /// Текст с колличеством лайков
    var likeCount: String
    /// Аватарка пользователя
    var userAvatarName: String
    /// Комментировать
    var commented: String
    /// Время публикации
    var publicationTime: String
    /// Массив картинок
    var imagePages = [String]()
}
