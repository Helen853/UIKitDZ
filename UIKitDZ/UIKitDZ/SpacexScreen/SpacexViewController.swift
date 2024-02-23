// SpacexViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран сайта "Spacex"
final class SpacexViewController: UIViewController {
    // MARK: - Visual Components

    private let webView = WKWebView()
    private let toolBar = UIToolbar()
    private let previousImageView = UIImageView()
    private let nextImageView = UIImageView()
    private let updateImageView = UIImageView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        configureToolBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadRequest()
    }

    // MARK: - Private Methods

    private func configureWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false

        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com/vehicles/starship/") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    private func configureToolBar() {
        previousImageView.image = UIImage(named: AppConstants.previous)
        nextImageView.image = UIImage(named: AppConstants.next)
        updateImageView.image = UIImage(named: AppConstants.update)

        let leftButtonItem = UIBarButtonItem(customView: previousImageView)
        let secondLeftButtonItem = UIBarButtonItem(customView: nextImageView)
        let rightButtonItem = UIBarButtonItem(customView: updateImageView)
        let spacer = UIBarButtonItem(systemItem: .fixedSpace)

        view.addSubview(toolBar)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.items = [leftButtonItem, secondLeftButtonItem, spacer, rightButtonItem]

        toolBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        toolBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        toolBar.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: -15).isActive = true
        toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
