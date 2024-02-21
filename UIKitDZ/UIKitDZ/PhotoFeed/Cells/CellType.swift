// CellType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

//////Протокол предоставляет информацию о типе модели
protocol CellTypeProtocol {
    var cellType: TableCellsTypes { get }
}

/// Энам для типов ячеек
enum TableCellsTypes {
    case recomendation
    case stories
    case post
}
