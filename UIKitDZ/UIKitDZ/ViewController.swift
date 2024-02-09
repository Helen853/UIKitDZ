// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var enterButtton: UIButton!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var vectorButton: UIButton!
    var isOpenPassword = false

    @IBOutlet var passwordTextField: UITextField!

    // MARK: - Public Methods

    @IBAction func openPassword(_ sender: Any) {
        vectorButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboardDidShow),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }
    
    // MARK: - Private Methods

    @objc private func tapButton() {
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

    @objc private func handleKeyboardDidShow() {
        guard
            let passwordTextFieldText = passwordTextField.text,
            let loginTextFieldText = loginTextField.text,
            !passwordTextFieldText.isEmpty,
            !loginTextFieldText.isEmpty
        else {
            enterButtton.isEnabled = false
            enterButtton.alpha = 0.5
            return
        }
        enterButtton.isEnabled = true
        enterButtton.alpha = 1
    }
}
