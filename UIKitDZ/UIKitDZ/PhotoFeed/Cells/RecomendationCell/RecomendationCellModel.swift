// RecomendationCellModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для ячейки с рекомендациями
struct Recommend: CellTypeProtocol {
    var cellType: TableCellsTypes = .recomendation
    var nameImage: String
    var nameUser: String
    var title: String
    var allText: String
    var titleButton: String
    var secondAvatar: String
    var secondNameUser: String
}
