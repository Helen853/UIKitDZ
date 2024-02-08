// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var vectorButton: UIButton!
    var isOpenPassword = false

    @IBOutlet var passwordTextField: UITextField!

    // MARK: - Public Methods

    @IBAction func openPassword(_ sender: Any) {
        vectorButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    @objc func tapButton() {
        switch isOpenPassword {
        case false:
            isOpenPassword = true
            vectorButton.setImage(UIImage(named: "Vector"), for: .normal)
            passwordTextField.isSecureTextEntry = true

        case true:
            isOpenPassword = false
            vectorButton.setImage(UIImage(named: "VectorOpen"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }
    }
}
