// StoriesCellModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для ячейки с историями
struct Stories: CellTypeProtocol {
    let cellType: TableCellsTypes = .stories

    let nameImage: String
    let nameLabel: String
    let avatarLavanda: String
    let nameUser: String
}
