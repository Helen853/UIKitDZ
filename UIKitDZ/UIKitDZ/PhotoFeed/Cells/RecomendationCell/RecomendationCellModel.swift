// RecomendationCellModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Рекомендации
struct Recommend: CellTypeProtocol {
    ///Тип ячейки
    var cellType: TableCellsTypes = .recomendation
    ///Аватарка пользователя
    var imageName: String
    ///Имя пользователя
    var userName: String
    ///Заголовок ячейки
    var title: String
    ///Заголовок справа ячейки
    var rightTitle: String
    ///Текст на кнопке
    var buttonTitle: String
    ///Аватар второго пользователя
    var secondAvatar: String
    ///Имя второго пользователя
    var secondUserName: String
}
