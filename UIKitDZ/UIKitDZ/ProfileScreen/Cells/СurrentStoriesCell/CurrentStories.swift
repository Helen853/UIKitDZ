// CurrentStories.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Ячейка с актуальными исторями
struct CurrentStories: ProfileInfoProtocol {
    // Тип ячейки
    var cellType: ProfileInfoTypes = .stories
    // Картинка с запуском
    var imageLaunch: String
    // Картинка с луной
    var imageMoon: String
    // Картинка с космонавтом
    var imageAstronaut: String
    // Картинка с космосом
    var imageSpace: String
}
