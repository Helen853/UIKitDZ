// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отображающий экран входа в приложение
final class ViewController: UIViewController {
    // MARK: - Constants

    let cakeImageView = UIImageView()
    let birthdayLabel = UILabel()
    let signInLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let lineView = UIView()
    let secondLineView = UIView()
    let vectorButton = UIButton()
    let faceIdLabel = UILabel()
    let faceIdSwitch = UISwitch()

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        configImageView()
        configBirthdayLabel()
        configSignInLabel()
        configEmailLabel()
        configPasswordLabel()
        configTextField(
            nameTextField: emailTextField,
            placeholderText: "Typing email",
            top: 347
        )
        configTextField(
            nameTextField: passwordTextField,
            placeholderText: "Typing password",
            top: 422
        )
        passwordTextField.isSecureTextEntry = true
        configLineView(nameView: lineView, top: 372)
        configLineView(nameView: secondLineView, top: 448)
        configLoginButton()
        configVectorButton()
    }

    // MARK: - Private Methods

    // Метод настройки картинки с тортом
    private func configImageView() {
        view.addSubview(cakeImageView)
        cakeImageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        cakeImageView.image = UIImage(named: "image-3")
    }

    // Метод настройки лейбла с текстом под картинкой
    private func configBirthdayLabel() {
        view.addSubview(birthdayLabel)
        birthdayLabel.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        birthdayLabel.text = "Birthday \n Reminder"
        birthdayLabel.font = UIFont(name: "Verdana", size: 18)
        birthdayLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        birthdayLabel.textColor = #colorLiteral(red: 0.4306637049, green: 0.3503972888, blue: 0.6471487284, alpha: 1)
        birthdayLabel.numberOfLines = 2
        birthdayLabel.textAlignment = .center
    }

    // Общий метод настройки лейблов (для входа, логина, пароля)
    private func configLabel(nameLabel: UILabel, fontSize: CGFloat, text: String) {
        view.addSubview(nameLabel)
        nameLabel.textColor = .red
        nameLabel.font = UIFont(name: "Verdana", size: fontSize)
        nameLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        nameLabel.text = text
    }

    // Метод настройки лейбла "Sign in"
    private func configSignInLabel() {
        configLabel(nameLabel: signInLabel, fontSize: 26, text: "Sign in")
        signInLabel.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
    }

    // Метод настройки лейбла емаил
    private func configEmailLabel() {
        configLabel(nameLabel: emailLabel, fontSize: 16, text: "Email")
        emailLabel.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
    }

    // Метод настройки лейбла пароль
    private func configPasswordLabel() {
        configLabel(nameLabel: passwordLabel, fontSize: 16, text: "Password")
        passwordLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
    }

    // Общий метод настройки для полей воода логина и пароля
    private func configTextField(nameTextField: UITextField, placeholderText: String, top: Int) {
        view.addSubview(nameTextField)
        nameTextField.placeholder = placeholderText
        nameTextField.frame = CGRect(x: 20, y: top, width: 175, height: 17)
    }

    // Общий метод настройки линий под текстфилдами
    private func configLineView(nameView: UIView, top: CGFloat) {
        view.addSubview(nameView)
        nameView.frame = CGRect(x: 20, y: top, width: 335, height: 1)
        nameView.backgroundColor = #colorLiteral(red: 0.8500393629, green: 0.8703018427, blue: 0.8895121813, alpha: 1)
    }

    // Метод настройки кнопки "Глаз" для отображения пароля
    private func configVectorButton() {
        view.addSubview(vectorButton)
        vectorButton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        vectorButton.setImage(UIImage(named: "Vector"), for: .normal)
        vectorButton.addTarget(self, action: #selector(openPassword), for: .touchUpInside)
    }

    // Метод настройки кнопки входа
    private func configLoginButton() {
        view.addSubview(loginButton)
        loginButton.backgroundColor = .red
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
    }

    // Метод настройки лйбла (около свитча который) для фэйс ай ди
    private func configFaceIdLabel() {
        view.addSubview(faceIdLabel)
        faceIdLabel.frame = CGRect(x: 110, y: 544, width: 150, height: 35)
        faceIdLabel.text = "Use FaceID"
        faceIdLabel.font = UIFont(name: "Verdana", size: 16)
        faceIdLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    // Метод настройки свитча для FaceID
    private func configSwitch() {
        view.addSubview(faceIdSwitch)
        faceIdSwitch.frame = CGRect(x: 210, y: 546, width: 31, height: 31)
        faceIdSwitch.setOn(true, animated: true)
    }

    // Метод перехода на новый экран при нажатии на кнопку входа "Login"
    @objc private func tapLoginButton() {
        let list = ListViewController()
        navigationController?.pushViewController(list, animated: true)
    }

    // Метод для появления клавиатуры и проверки на введенный текст.
    // после нажатия на поля ввода появляется лейбл с FaceID и свитчом
    @objc private func handleKeyboardDidShow() {
        guard
            let passwordTextFieldText = passwordTextField.text,
            let loginTextFieldText = emailTextField.text,
            !passwordTextFieldText.isEmpty,
            !loginTextFieldText.isEmpty
        else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
            configFaceIdLabel()
            configSwitch()
            return
        }
        loginButton.isEnabled = true
        loginButton.alpha = 1
        configFaceIdLabel()
        configSwitch()
    }

    // Метод для отображения введенного пароля
    @objc private func openPassword() {
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
