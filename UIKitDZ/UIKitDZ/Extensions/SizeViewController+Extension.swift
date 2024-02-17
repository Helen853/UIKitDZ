// SizeViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для установки констреинтов
extension SizeViewController {
    func setupConstraints() {
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        sizeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 23).isActive = true
        sizeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        size35Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 77).isActive = true
        size35Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        lineView.topAnchor.constraint(equalTo: size35Button.bottomAnchor, constant: 5).isActive = true
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        size36Button.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
        size36Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        lineTwoView.topAnchor.constraint(equalTo: size36Button.bottomAnchor, constant: 5).isActive = true
        lineTwoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lineTwoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lineTwoView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        size37Button.topAnchor.constraint(equalTo: lineTwoView.bottomAnchor, constant: 5).isActive = true
        size37Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        lineThreeView.topAnchor.constraint(equalTo: size37Button.bottomAnchor, constant: 5).isActive = true
        lineThreeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lineThreeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lineThreeView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        size38Button.topAnchor.constraint(equalTo: lineThreeView.bottomAnchor, constant: 5).isActive = true
        size38Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        lineFourView.topAnchor.constraint(equalTo: size38Button.bottomAnchor, constant: 5).isActive = true
        lineFourView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lineFourView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lineFourView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        size39Button.topAnchor.constraint(equalTo: lineFourView.bottomAnchor, constant: 5).isActive = true
        size39Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        lineFiveView.topAnchor.constraint(equalTo: size39Button.bottomAnchor, constant: 5).isActive = true
        lineFiveView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lineFiveView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lineFiveView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
