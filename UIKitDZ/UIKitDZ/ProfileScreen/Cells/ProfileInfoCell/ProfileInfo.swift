// ProfileInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

struct ProfileInfo: ProfileInfoProtocol {
    var cellType: ProfileInfoTypes = .info

    /// Аватарка пользователя сделавшего публикацию
    var avatarName: String
    /// Имя пользователя
    var userName: String

    var countPost: String
    var countFollowers: String
    var countsubscriptions: String
    var description: String
}
