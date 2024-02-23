// СurrentStoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с актуальными  историями
final class СurrentStoriesTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let launchImageView = UIImageView()
    private let moonImageView = UIImageView()
    private let astronautImageView = UIImageView()
    private let spaceImageView = UIImageView()
    private let secondLaunchImageView = UIImageView()
    private let secondMoonImageView = UIImageView()
    private let launchLabel = UILabel()
    private let moonLabel = UILabel()
    private let astronautLabel = UILabel()
    private let spaceLabel = UILabel()
    private let secondLaunchLabel = UILabel()
    private let secondMoonLabel = UILabel()
    private let scrollView = UIScrollView()

    var showStoriesHandler: (() -> Void)?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureScroll()
        setupStories()
        configureLabel()
        setupLabel()
        tapStories()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configureCell(model: CurrentStories, tapStories: (() -> Void)?) {
        launchImageView.image = UIImage(named: model.imageLaunch)
        moonImageView.image = UIImage(named: model.imageMoon)
        astronautImageView.image = UIImage(named: model.imageAstronaut)
        spaceImageView.image = UIImage(named: model.imageSpace)
        secondLaunchImageView.image = UIImage(named: model.imageLaunch)
        secondMoonImageView.image = UIImage(named: model.imageMoon)

        launchLabel.text = model.imageLaunch
        moonLabel.text = model.imageMoon
        astronautLabel.text = model.imageAstronaut
        spaceLabel.text = model.imageSpace
        secondLaunchLabel.text = model.imageLaunch
        secondMoonLabel.text = model.imageMoon
        showStoriesHandler = tapStories
    }

    // MARK: - Private Methods

    private func configureScroll() {
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = contentView.bounds.size
        scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }

    private func configureStorues(nameImage: UIImageView) {
        scrollView.addSubview(nameImage)
        nameImage.clipsToBounds = true
        nameImage.layer.cornerRadius = 25
        nameImage.layer.borderWidth = 2
        nameImage.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        nameImage.translatesAutoresizingMaskIntoConstraints = false
        nameImage.widthAnchor.constraint(equalToConstant: 49).isActive = true
        nameImage.heightAnchor.constraint(equalToConstant: 49).isActive = true
        nameImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 17).isActive = true
        nameImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    private func setupStories() {
        configureStorues(nameImage: launchImageView)
        configureStorues(nameImage: moonImageView)
        configureStorues(nameImage: astronautImageView)
        configureStorues(nameImage: spaceImageView)
        configureStorues(nameImage: secondLaunchImageView)
        configureStorues(nameImage: secondMoonImageView)
        launchImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 18).isActive = true
        moonImageView.leadingAnchor.constraint(equalTo: launchImageView.trailingAnchor, constant: 22).isActive = true
        astronautImageView.leadingAnchor.constraint(equalTo: moonImageView.trailingAnchor, constant: 22).isActive = true
        spaceImageView.leadingAnchor.constraint(equalTo: astronautImageView.trailingAnchor, constant: 22)
            .isActive = true
        secondLaunchImageView.leadingAnchor.constraint(equalTo: spaceImageView.trailingAnchor, constant: 22)
            .isActive = true
        secondMoonImageView.leadingAnchor.constraint(equalTo: secondLaunchImageView.trailingAnchor, constant: 22)
            .isActive = true
        secondMoonImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5)
            .isActive = true
        scrollView.heightAnchor.constraint(equalTo: launchImageView.heightAnchor, constant: 40).isActive = true
    }

    private func tapStories() {
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(showStories))
        launchImageView.addGestureRecognizer(tapGestRecognizer)
        launchImageView.isUserInteractionEnabled = true
    }

    private func configureLabel() {
        scrollView.addSubview(launchLabel)
        launchLabel.textAlignment = .center
        launchLabel.font = UIFont.systemFont(ofSize: 10)
        launchLabel.textColor = .black
        launchLabel.translatesAutoresizingMaskIntoConstraints = false
        launchLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        launchLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        launchLabel.topAnchor.constraint(equalTo: launchImageView.bottomAnchor, constant: 7).isActive = true
        launchLabel.centerXAnchor.constraint(equalTo: launchImageView.centerXAnchor).isActive = true
    }

    private func configureLabel(nameLabel: UILabel, nameImageView: UIImageView) {
        scrollView.addSubview(nameLabel)
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 76).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: nameImageView.centerXAnchor).isActive = true
    }

    private func setupLabel() {
        configureLabel(nameLabel: moonLabel, nameImageView: moonImageView)
        configureLabel(nameLabel: astronautLabel, nameImageView: astronautImageView)
        configureLabel(nameLabel: spaceLabel, nameImageView: spaceImageView)
        configureLabel(nameLabel: secondLaunchLabel, nameImageView: secondLaunchImageView)
        configureLabel(nameLabel: secondMoonLabel, nameImageView: secondMoonImageView)
    }

    @objc private func showStories() {
        showStoriesHandler?()
    }
}
