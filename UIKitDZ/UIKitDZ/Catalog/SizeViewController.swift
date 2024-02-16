// SizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран для выбора размера обуви
final class SizeViewController: UIViewController {
    // MARK: - Visual Components

    let sizeLabel: UILabel = {
        let element = UILabel()
        element.text = Constants.sizeLabel
        element.font = UIFont(name: Constants.verdana, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let lineView: UIView = {
        let element = UIImageView()
        element.backgroundColor = UIColor.gray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    let lineTwoView: UIView = {
        let element = UIImageView()
        element.backgroundColor = UIColor.gray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var closeButton: UIButton = {
        let element = UIButton()
        element.setImage(Constants.closeImage, for: .normal)
        element.tintColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return element
    }()

    lazy var size35Button: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .black
        element.setTitle(Constants.size35, for: .normal)
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        element.titleLabel?.font = UIFont(name: Constants.verdana, size: 16)
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var size36Button: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .black
        element.setTitle(Constants.size36, for: .normal)
        element.titleLabel?.font = UIFont(name: Constants.verdana, size: 16)
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var size37Button: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .black
        element.setTitle(Constants.size37, for: .normal)
        element.titleLabel?.font = UIFont(name: Constants.verdana, size: 16)
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var size38Button: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .black
        element.setTitle(Constants.size38, for: .normal)
        element.titleLabel?.font = UIFont(name: Constants.verdana, size: 16)
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var size39Button: UIButton = {
        let element = UIButton(type: .system)
        element.tintColor = .black
        element.setTitle(Constants.size39, for: .normal)
        element.titleLabel?.font = UIFont(name: Constants.verdana, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return element
    }()

    lazy var lineThreeView: UIView = {
        let element = UIImageView()
        element.backgroundColor = UIColor.gray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var lineFourView: UIView = {
        let element = UIImageView()
        element.backgroundColor = UIColor.gray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var lineFiveView: UIView = {
        let element = UIImageView()
        element.backgroundColor = UIColor.gray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
    }

    // MARK: - Private methods

    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(sizeLabel)
        view.addSubview(size35Button)
        view.addSubview(size36Button)
        view.addSubview(size37Button)
        view.addSubview(size38Button)
        view.addSubview(size39Button)
        view.addSubview(lineView)
        view.addSubview(lineTwoView)
        view.addSubview(lineThreeView)
        view.addSubview(lineFourView)
        view.addSubview(lineFiveView)
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}
