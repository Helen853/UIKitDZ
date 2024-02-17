// ShoesViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для установки констреинтов
extension ShoesViewController {
    func setupConstraints() {
        shoesBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33)
            .isActive = true
        shoesBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        shoesBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        shoesBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

        lofershoesBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33)
            .isActive = true
        lofershoesBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

        lofershoesBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        lofershoesBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

        yelowshoesBackgroundView.topAnchor.constraint(equalTo: lofershoesBackgroundView.bottomAnchor, constant: 10)
            .isActive = true
        yelowshoesBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

        yelowshoesBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        yelowshoesBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

        sportShoesBackgroundView.topAnchor.constraint(equalTo: shoesBackgroundView.bottomAnchor, constant: 10)
            .isActive = true
        sportShoesBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        sportShoesBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        sportShoesBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

        conversShoesBackgroundView.topAnchor.constraint(equalTo: sportShoesBackgroundView.bottomAnchor, constant: 10)
            .isActive = true
        conversShoesBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        conversShoesBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        conversShoesBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

        blackHeelsImageView.leftAnchor.constraint(equalTo: shoesBackgroundView.leftAnchor, constant: 29).isActive = true
        blackHeelsImageView.topAnchor.constraint(equalTo: shoesBackgroundView.topAnchor, constant: 27).isActive = true
        blackHeelsImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        blackHeelsImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        lofersImageView.leftAnchor.constraint(equalTo: lofershoesBackgroundView.leftAnchor, constant: 29)
            .isActive = true
        lofersImageView.topAnchor.constraint(equalTo: lofershoesBackgroundView.topAnchor, constant: 27).isActive = true
        lofersImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        lofersImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        yellowImageView.leftAnchor.constraint(equalTo: yelowshoesBackgroundView.leftAnchor, constant: 29)
            .isActive = true
        yellowImageView.topAnchor.constraint(equalTo: yelowshoesBackgroundView.topAnchor, constant: 27).isActive = true
        yellowImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        yellowImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        sportImageView.leftAnchor.constraint(equalTo: sportShoesBackgroundView.leftAnchor, constant: 29).isActive = true
        sportImageView.topAnchor.constraint(equalTo: sportShoesBackgroundView.topAnchor, constant: 27).isActive = true
        sportImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sportImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        conversImageView.leftAnchor.constraint(equalTo: conversShoesBackgroundView.leftAnchor, constant: 29)
            .isActive = true
        conversImageView.topAnchor.constraint(equalTo: conversShoesBackgroundView.topAnchor, constant: 27)
            .isActive = true
        conversImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        conversImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func setupLabelConstraints() {
        blackHeelsshoesLabel.topAnchor.constraint(equalTo: shoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        blackHeelsshoesLabel.rightAnchor.constraint(equalTo: shoesBackgroundView.rightAnchor, constant: -9)
            .isActive = true

        sportshoesLabel.topAnchor.constraint(equalTo: sportShoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        sportshoesLabel.rightAnchor.constraint(equalTo: sportShoesBackgroundView.rightAnchor, constant: -9)
            .isActive = true

        conversShoesLabel.topAnchor.constraint(equalTo: conversShoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        conversShoesLabel.rightAnchor.constraint(equalTo: conversShoesBackgroundView.rightAnchor, constant: -9)
            .isActive = true

        lofershoesLabel.topAnchor.constraint(equalTo: lofershoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        lofershoesLabel.rightAnchor.constraint(equalTo: lofershoesBackgroundView.rightAnchor, constant: -9)
            .isActive = true

        yellowShoesLabel.topAnchor.constraint(equalTo: yelowshoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        yellowShoesLabel.rightAnchor.constraint(equalTo: yelowshoesBackgroundView.rightAnchor, constant: -9)
            .isActive = true
    }

    func setupButtonConstraints() {
        basketButton.rightAnchor.constraint(equalTo: shoesBackgroundView.rightAnchor, constant: -11).isActive = true
        basketButton.topAnchor.constraint(equalTo: shoesBackgroundView.topAnchor, constant: 11).isActive = true
        basketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        basketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true

        lofersBasketButton.rightAnchor.constraint(equalTo: lofershoesBackgroundView.rightAnchor, constant: -11)
            .isActive = true
        lofersBasketButton.topAnchor.constraint(equalTo: lofershoesBackgroundView.topAnchor, constant: 11)
            .isActive = true
        lofersBasketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lofersBasketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true

        yellowBasketButton.rightAnchor.constraint(equalTo: yelowshoesBackgroundView.rightAnchor, constant: -11)
            .isActive = true
        yellowBasketButton.topAnchor.constraint(equalTo: yelowshoesBackgroundView.topAnchor, constant: 11)
            .isActive = true
        yellowBasketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        yellowBasketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true

        sportBasketButton.rightAnchor.constraint(equalTo: sportShoesBackgroundView.rightAnchor, constant: -11)
            .isActive = true
        sportBasketButton.topAnchor.constraint(equalTo: sportShoesBackgroundView.topAnchor, constant: 11)
            .isActive = true
        sportBasketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sportBasketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true

        conversBasketButton.rightAnchor.constraint(equalTo: conversShoesBackgroundView.rightAnchor, constant: -11)
            .isActive = true
        conversBasketButton.topAnchor.constraint(equalTo: conversShoesBackgroundView.topAnchor, constant: 11)
            .isActive = true
        conversBasketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        conversBasketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true
    }
}
