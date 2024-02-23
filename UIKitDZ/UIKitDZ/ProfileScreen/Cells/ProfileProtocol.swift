// ProfileProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Общий протокол для объектов которые могут выступать в качестве ячеек в профиле
protocol ProfileInfoProtocol {
    /// Тип информации
    var cellType: ProfileInfoTypes { get }
}
