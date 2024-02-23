// StoriesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран сторис
final class StoriesViewController: UIViewController {
    // MARK: - Visual Components

    private let imageView = UIImageView()
    private let circleImageView = UIImageView()
    private let progress = UIProgressView()
    private var timer = Timer()
    private let nameStoriesLabel = UILabel()
    private let closeButton = UIButton()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configBackground()
        configCircle()
        configureProgress()
        configureTimer()
        configureLabel()
        configureButtonClose()
    }

    // MARK: - Private Methods

    private func configBackground() {
        view.addSubview(imageView)
        imageView.image = UIImage(named: AppConstants.storiesRocket)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func configCircle() {
        view.addSubview(circleImageView)
        circleImageView.clipsToBounds = true
        circleImageView.layer.cornerRadius = 13
        circleImageView.image = UIImage(named: AppConstants.rocket)
        circleImageView.translatesAutoresizingMaskIntoConstraints = false

        circleImageView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        circleImageView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        circleImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 7).isActive = true
        circleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 67).isActive = true
    }

    private func configureProgress() {
        view.addSubview(progress)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.widthAnchor.constraint(equalToConstant: 365).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 1).isActive = true
        progress.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        progress.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        progress.progressViewStyle = .bar
        progress.setProgress(0.0, animated: true)
        progress.progressTintColor = UIColor.gray
        progress.trackTintColor = .black
    }

    private func configureTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(duration),
            userInfo: self,
            repeats: true
        )
    }

    private func configureLabel() {
        view.addSubview(nameStoriesLabel)
        nameStoriesLabel.text = AppConstants.launch
        nameStoriesLabel.textColor = .white
        nameStoriesLabel.font = UIFont.systemFont(ofSize: 10)

        nameStoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        nameStoriesLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        nameStoriesLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        nameStoriesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42).isActive = true
        nameStoriesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 74).isActive = true
    }

    private func configureButtonClose() {
        view.addSubview(closeButton)
        closeButton.setImage(UIImage(named: AppConstants.buttonName), for: .normal)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        closeButton.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 16).isActive = true
        closeButton.addTarget(self, action: #selector(dismissStories), for: .touchUpInside)
    }

    @objc private func dismissStories() {
        dismiss(animated: true)
    }

    @objc private func duration() {
        if progress.progress != 1.0 {
            UIView.animate(withDuration: 1.0) { [weak self] in
                self?.progress.progress += 0.05 / 1.0
            }
        } else if progress.progress == 1.0 {
            UIView.animate(withDuration: 10, animations: { [weak self] in
                self?.timer.invalidate()
            })
        }
    }
}
