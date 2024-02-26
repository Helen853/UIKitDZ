// SecondTrafficLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора кодом
final class SecondTrafficLightViewController: UIViewController {
    // MARK: - Visual Components

    private let blackView = UIView()
    private let colors: [UIColor] = [.red, .yellow, .green]
    private let redView = UIView()
    private let yellowView = UIView()
    private let stackView = UIStackView()

    // MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureBlackView()
        configureStack()
    }

    // MARK: - Private Methods

    private func configureBlackView() {
        view.addSubview(blackView)
        blackView.backgroundColor = .black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        let constrintHeight = blackView.heightAnchor.constraint(equalToConstant: 376)
        blackView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        constrintHeight.priority = .defaultLow
        constrintHeight.isActive = true

        let height = blackView.heightAnchor.constraint(equalToConstant: 346)
        height.priority = .defaultHigh
        height.isActive = true
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func configureStack() {
        let stackView = UIStackView(arrangedSubviews: colors.map { configureColorView(color: $0) })
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        blackView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -25).isActive = true
        stackView.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: blackView.bottomAnchor, constant: -15).isActive = true
    }

    private func configureColorView(color: UIColor) -> UIView {
        let coloredView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        coloredView.backgroundColor = color
        return coloredView
    }
}
