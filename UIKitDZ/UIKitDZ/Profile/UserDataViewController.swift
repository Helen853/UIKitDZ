// UserDataViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображающий данные пользователя
final class UserDataViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let titleText = "Мои данные"
        static let backText = "Стрелка"

        static let name = "Имя"
        static let surname = "Фамилия"
        static let size = "Размер ноги"
        static let birth = "Дата рождения"
        static let email = "Почта"
        static let phone = "Номер телефона"
        static let save = "Сохранить"
        static let phoneText = "phoneTextField"
        static let emailText = "emailTextField"
        static let nameText = "nameTextField"
        static let phoneFormat = "+X (XXX) XXX-XXXX"
        static let emailFormat = "gmail.com"
        static let dateFormat = "dd.MM.yyyy"

        static let maxNumCount = 11
    }

    // MARK: - Visual Components

    private let backButton = UIButton()
    private let saveButton = UIButton()

    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let phoneTextField = UITextField()
    private let sizeTextField = UITextField()
    private let birthTextField = UITextField()
    private let emailTextField = UITextField()

    private let datePicker = UIDatePicker()
    private let titleLabel = UILabel()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configBack()
        setupTextField()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configBirth()
        configView()
    }

    // MARK: - Private Methods

    private func configView() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.text = Constants.titleText

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 130).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 53).isActive = true
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    private func configBack() {
        view.addSubview(backButton)
        backButton.setImage(UIImage(named: Constants.backText), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 9).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 63).isActive = true
        backButton.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
    }

    private func configTextField(nameTextField: UITextField, text: String, top: CGFloat) {
        view.addSubview(nameTextField)
        nameTextField.placeholder = text

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        nameTextField.layer.cornerRadius = 12
        nameTextField.backgroundColor = #colorLiteral(red: 0.9782040715, green: 0.9782039523, blue: 0.9782040715, alpha: 1)
    }

    private func setupTextField() {
        configTextField(nameTextField: nameTextField, text: Constants.name, top: 113)
        nameTextField.delegate = self
        configTextField(nameTextField: surnameTextField, text: Constants.surname, top: 167)
        configTextField(nameTextField: phoneTextField, text: Constants.phone, top: 221)
        phoneTextField.textContentType = .telephoneNumber
        phoneTextField.delegate = self
        configTextField(nameTextField: sizeTextField, text: Constants.size, top: 275)
        configTextField(nameTextField: birthTextField, text: Constants.birth, top: 329)
        configTextField(nameTextField: emailTextField, text: Constants.email, top: 383)
        emailTextField.textContentType = .emailAddress
        emailTextField.delegate = self
        phoneTextField.accessibilityIdentifier = Constants.phoneText
        emailTextField.accessibilityIdentifier = Constants.emailText
        nameTextField.accessibilityIdentifier = Constants.nameText
    }

    private func formatPhoneNumber(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        for char in mask where index < numbers.endIndex {
            if char == "X" {
                result.append(numbers[index])

                index = numbers.index(after: index)

            } else {
                result.append(char)
            }
        }
        return result
    }

    private func formatMailAdress(with mailDomain: String, adress: String) -> String {
        guard !adress.contains("@") else { return adress }
        return adress + "@\(mailDomain)"
    }

    private func configSave() {
        view.addSubview(saveButton)
        saveButton.setTitle(Constants.save, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        saveButton.backgroundColor = #colorLiteral(red: 0.9155070186, green: 0.2173944712, blue: 0.5847681761, alpha: 1)
        saveButton.layer.cornerRadius = 12
        saveButton.addTarget(self, action: #selector(closeButton), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654).isActive = true
    }

    private func configBirth() {
        birthTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .automatic
        birthTextField.delegate = self

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([rightBarButton, doneButton], animated: true)
        birthTextField.inputAccessoryView = toolBar
    }

    @objc private func doneAction() {
        let formater = DateFormatter()
        formater.dateFormat = Constants.dateFormat
        birthTextField.text = formater.string(from: datePicker.date)
        view.endEditing(true)
        birthTextField.resignFirstResponder()
    }

    @objc private func closeButton() {
        saveButton.removeFromSuperview()
    }

    @objc private func showProfile() {
        dismiss(animated: true)
    }
}

/// Расширение для контроля введеного текста в полях ввода: Имя, Номер телефона, Эл. почта
extension UserDataViewController: UITextFieldDelegate {
    /// - TextField: принимаемое поля ввода
    func textFieldDidEndEditing(_ textField: UITextField) {
        // проверяем наличие текста в поле ввода
        guard
            let textFieldText = textField.text,
            !textFieldText.isEmpty
        else { return }

        // в зависимости от идентификатора текстфилда выплняем определенную операция после введенного текста
        switch textField.accessibilityIdentifier {
        case Constants.phoneText:
            textField.text = formatPhoneNumber(with: Constants.phoneFormat, phone: textFieldText)
        case Constants.emailText:
            textField.text = formatMailAdress(with: Constants.emailFormat, adress: textFieldText)
        case Constants.nameText:
            configSave()
        default: break
        }
    }
}
