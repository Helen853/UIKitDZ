// UserBasket.swift
// Copyright © RoadMap. All rights reserved.

/// Хранилище данных о обуви в корзине
final class UserBasket {
    static var basket = UserBasket()

    private init() {}

    var usersSupply: [String] = []
}
