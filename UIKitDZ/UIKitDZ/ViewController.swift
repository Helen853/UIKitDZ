// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый класс с авторизацией
final class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var enterButtton: UIButton!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var vectorButton: UIButton!
    @IBOutlet private var passwordTextField: UITextField!
    
    // MARK: - Private Properties
    
    private var isOpenPassword = false

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboardDidShow),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }
    
    // MARK: - IBAction

    @IBAction private func openPassword(_ sender: Any) {
        vectorButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    
    //Метод для отображения введенного пароля
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
    
    //Метод проверки поля ввода на наличие введенных символов
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
