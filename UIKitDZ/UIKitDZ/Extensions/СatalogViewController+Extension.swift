// СatalogViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для установки констреинтов
extension СatalogViewController {
    func setupConstraints() {
        brendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        brendButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        brendButton.topAnchor.constraint(equalTo: saleImageView.bottomAnchor, constant: 20).isActive = true
        brendButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        shoesButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        shoesButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        shoesButton.topAnchor.constraint(equalTo: brendButton.bottomAnchor, constant: 20).isActive = true
        shoesButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        bagsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bagsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bagsButton.topAnchor.constraint(equalTo: shoesButton.bottomAnchor, constant: 20).isActive = true
        bagsButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        brendsLabel.leftAnchor.constraint(equalTo: brendButton.leftAnchor, constant: 20).isActive = true
        brendsLabel.topAnchor.constraint(equalTo: brendButton.topAnchor, constant: 31).isActive = true

        shoesLabel.leftAnchor.constraint(equalTo: shoesButton.leftAnchor, constant: 20).isActive = true
        shoesLabel.topAnchor.constraint(equalTo: shoesButton.topAnchor, constant: 31).isActive = true

        bagLabel.leftAnchor.constraint(equalTo: bagsButton.leftAnchor, constant: 20).isActive = true
        bagLabel.topAnchor.constraint(equalTo: bagsButton.topAnchor, constant: 31).isActive = true

        brandsImageView.rightAnchor.constraint(equalTo: brendButton.rightAnchor).isActive = true
        brandsImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        brandsImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true

        shoesImageView.rightAnchor.constraint(equalTo: shoesButton.rightAnchor).isActive = true
        shoesImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        shoesImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true

        bagImageView.rightAnchor.constraint(equalTo: bagsButton.rightAnchor).isActive = true
        bagImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bagImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true

        newImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        newImageView.topAnchor.constraint(equalTo: segmentedControll.bottomAnchor, constant: 20).isActive = true
        newImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        newImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true

        saleImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        saleImageView.topAnchor.constraint(equalTo: segmentedControll.bottomAnchor, constant: 20).isActive = true
        saleImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        saleImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true

        segmentedControll.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        segmentedControll.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        segmentedControll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22)
            .isActive = true
        segmentedControll.heightAnchor.constraint(equalToConstant: 44).isActive = true

        newLabel.leftAnchor.constraint(equalTo: newImageView.leftAnchor, constant: 2).isActive = true
        newLabel.rightAnchor.constraint(equalTo: newImageView.rightAnchor, constant: -2).isActive = true
        newLabel.topAnchor.constraint(equalTo: newImageView.topAnchor).isActive = true

        saleLabel.leftAnchor.constraint(equalTo: saleImageView.leftAnchor, constant: 2).isActive = true
        saleLabel.rightAnchor.constraint(equalTo: saleImageView.rightAnchor, constant: -2).isActive = true
        saleLabel.bottomAnchor.constraint(equalTo: saleImageView.bottomAnchor).isActive = true
    }
}
