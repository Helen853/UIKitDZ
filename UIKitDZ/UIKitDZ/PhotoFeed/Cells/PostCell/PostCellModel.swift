// PostCellModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для ячейки с постом
struct Post: CellTypeProtocol {
    var cellType: TableCellsTypes = .post

    var avatarImage: String
    var nameUser: String
    var postImage: String
    var discriptionPost: String
    var likeImage: String
    var commentImage: String
    var sendImage: String
    var saveImage: String
    var likeTitle: String
    var avatarUser: String
    var commented: String
    var publicationTime: String
    var pages = [String]()
}
