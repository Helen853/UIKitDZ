// CellTypeProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// MARK: - Types

/// Энам для типов ячеек
enum TableCellsTypes {
    case recomendation
    case stories
    case post
}

protocol CellTypeProtocol {
    var cellType: TableCellsTypes { get }
}
