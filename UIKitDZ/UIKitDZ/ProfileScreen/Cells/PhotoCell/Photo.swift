// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Ячейка с фото
struct Photo: ProfileInfoProtocol {
    // Тип ячейки
    var cellType: ProfileInfoTypes = .photo
    // Массив фото
    var photos: [String]
}
