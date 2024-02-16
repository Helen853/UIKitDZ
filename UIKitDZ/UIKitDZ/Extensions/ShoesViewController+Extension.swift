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

        sportshoesBackgroundView.topAnchor.constraint(equalTo: shoesBackgroundView.bottomAnchor, constant: 10)
            .isActive = true
        sportshoesBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        sportshoesBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        sportshoesBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

        conversshoesBackgroundView.topAnchor.constraint(equalTo: sportshoesBackgroundView.bottomAnchor, constant: 10)
            .isActive = true
        conversshoesBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        conversshoesBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        conversshoesBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

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

        sportImageView.leftAnchor.constraint(equalTo: sportshoesBackgroundView.leftAnchor, constant: 29).isActive = true
        sportImageView.topAnchor.constraint(equalTo: sportshoesBackgroundView.topAnchor, constant: 27).isActive = true
        sportImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sportImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        conversImageView.leftAnchor.constraint(equalTo: conversshoesBackgroundView.leftAnchor, constant: 29)
            .isActive = true
        conversImageView.topAnchor.constraint(equalTo: conversshoesBackgroundView.topAnchor, constant: 27)
            .isActive = true
        conversImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        conversImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func setupLabelConstraints() {
        blackHeelsshoesLabel.topAnchor.constraint(equalTo: shoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        blackHeelsshoesLabel.rightAnchor.constraint(equalTo: shoesBackgroundView.rightAnchor, constant: -9)
            .isActive = true

        sportshoesLabel.topAnchor.constraint(equalTo: sportshoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        sportshoesLabel.rightAnchor.constraint(equalTo: sportshoesBackgroundView.rightAnchor, constant: -9)
            .isActive = true

        conversShoesLabel.topAnchor.constraint(equalTo: conversshoesBackgroundView.topAnchor, constant: 130)
            .isActive = true
        conversShoesLabel.rightAnchor.constraint(equalTo: conversshoesBackgroundView.rightAnchor, constant: -9)
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

        yelowBasketButton.rightAnchor.constraint(equalTo: yelowshoesBackgroundView.rightAnchor, constant: -11)
            .isActive = true
        yelowBasketButton.topAnchor.constraint(equalTo: yelowshoesBackgroundView.topAnchor, constant: 11)
            .isActive = true
        yelowBasketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        yelowBasketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true

        sportBasketButton.rightAnchor.constraint(equalTo: sportshoesBackgroundView.rightAnchor, constant: -11)
            .isActive = true
        sportBasketButton.topAnchor.constraint(equalTo: sportshoesBackgroundView.topAnchor, constant: 11)
            .isActive = true
        sportBasketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sportBasketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true

        conversBasketButton.rightAnchor.constraint(equalTo: conversshoesBackgroundView.rightAnchor, constant: -11)
            .isActive = true
        conversBasketButton.topAnchor.constraint(equalTo: conversshoesBackgroundView.topAnchor, constant: 11)
            .isActive = true
        conversBasketButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        conversBasketButton.widthAnchor.constraint(equalToConstant: 19).isActive = true
    }
}
