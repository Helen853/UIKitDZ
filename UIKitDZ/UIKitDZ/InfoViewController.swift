// InfoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

//Класс для введения информации о человеке
final class InfoViewController: UIViewController {
    // MARK: - Constants

    let avatarImageView = UIImageView()
    let changeLabel = UILabel()

    let nameLabel = UILabel()
    let birthdayLabel = UILabel()
    let ageLabel = UILabel()
    let genderLabel = UILabel()
    let telegramLabel = UILabel()

    let nameTextField = UITextField()
    let birthTextField = UITextField()
    let ageTextField = UITextField()
    let genderTextField = UITextField()
    let telegramTextField = UITextField()

    let lineView1 = UIView()
    let lineView2 = UIView()
    let lineView3 = UIView()
    let lineView4 = UIView()
    let lineView5 = UIView()

    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()

    let cancelButton = UIButton()
    let addButton = UIButton()

    let gender = ["Male", "Female"]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configAvatar()
        setUpInfoLabel()
        configChangeLabel()
        setupTextfield()
        setupLine()
        configBirth()
        configAgeField()
        configGenderField()
        configTelegramField()
        setupButton()
    }

    // MARK: - Private Methods

    //Метод настройки аватара
    private func configAvatar() {
        view.addSubview(avatarImageView)
        avatarImageView.frame = CGRect(x: 125, y: 134, width: 125, height: 125)
        avatarImageView.image = UIImage(named: "Эллипс 2-5")
    }

    //Метод настройки лейбла для выбора фото
    private func configChangeLabel() {
        view.addSubview(changeLabel)
        changeLabel.frame = CGRect(x: 125, y: 267, width: 125, height: 20)
        changeLabel.text = "Change photo"
        changeLabel.font = changeLabel.font.withSize(16)
        changeLabel.textColor = #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1)
    }

    //Общий метод настройки лейблов
    private func configLabel(nameLabel: UILabel, text: String, top: CGFloat) {
        view.addSubview(nameLabel)
        nameLabel.text = text
        nameLabel.frame = CGRect(x: 20, y: top, width: 175, height: 19)
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    //Метод настройки лейблов для полей ввода
    private func setUpInfoLabel() {
        configLabel(nameLabel: nameLabel, text: "Name Surname", top: 307)
        configLabel(nameLabel: birthdayLabel, text: "Birthday", top: 382)
        configLabel(nameLabel: ageLabel, text: "Age", top: 457)
        configLabel(nameLabel: genderLabel, text: "Gender", top: 530)
        configLabel(nameLabel: telegramLabel, text: "Telegram", top: 605)
    }

    //Общий метод настройки текстфилдов
    private func configTextField(nameTextField: UITextField, placeholderText: String, top: CGFloat) {
        view.addSubview(nameTextField)
        nameTextField.placeholder = placeholderText
        nameTextField.frame = CGRect(x: 20, y: top, width: 250, height: 17)
    }

    //Метода устанавливающий характеристики полям ввода
    private func setupTextfield() {
        configTextField(nameTextField: nameTextField, placeholderText: "Typing Name Surname", top: 335)
        configTextField(nameTextField: birthTextField, placeholderText: "Typing Date of Birth", top: 411)
        configTextField(nameTextField: ageTextField, placeholderText: "Typing age", top: 486)
        configTextField(nameTextField: genderTextField, placeholderText: "Indicate Gender", top: 559)
        configTextField(nameTextField: telegramTextField, placeholderText: "Typing Telegram", top: 634)
    }

    //Общий метод для настройки линий под полями ввода
    private func configLine(nameLine: UIView, top: CGFloat) {
        view.addSubview(nameLine)
        nameLine.frame = CGRect(x: 20, y: top, width: 335, height: 1)
        nameLine.backgroundColor = #colorLiteral(red: 0.8500393629, green: 0.8703018427, blue: 0.8895121813, alpha: 1)
    }

    //Метод задает параметры линиям
    private func setupLine() {
        configLine(nameLine: lineView1, top: 361)
        configLine(nameLine: lineView2, top: 436)
        configLine(nameLine: lineView3, top: 511)
        configLine(nameLine: lineView4, top: 584)
        configLine(nameLine: lineView5, top: 659)
    }

    //Метод отображающий календарь при вводе даты рождения. Настройка кнопки "done"
    private func configBirth() {
        birthTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels

        let toolBar = UIToolbar()

        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([rightBarButton, doneButton], animated: true)
        birthTextField.inputAccessoryView = toolBar
    }

    //Метод отображающий пикер с выбором чисел при вводе в поле возраста. Настройка кнопки "ОК" на пикере
    private func configAgeField() {
        ageTextField.inputView = agePicker
        agePicker.dataSource = self
        agePicker.delegate = self
        agePicker.accessibilityIdentifier = "agePicker"

        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(okAction))
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([rightBarButton, doneButton], animated: true)
        ageTextField.inputAccessoryView = toolBar
    }

    //Метод отображающий пикер с выбором пола при вводе в поле Gender, настройка кнопки "ОК" для пикера
    private func configGenderField() {
        genderTextField.inputView = genderPicker
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderPicker.accessibilityIdentifier = "genderPicker"

        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(okActionGender))
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([rightBarButton, doneButton], animated: true)
        genderTextField.inputAccessoryView = toolBar
    }

    //Метода настройки делегата для поля ввода телеграмма
    private func configTelegramField() {
        telegramTextField.delegate = self
    }

    //Метод отображающий алерт при введение в поле телеграмма
    private func showAlert() {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .default)
        let actionOk = UIAlertAction(title: "OK", style: .cancel) { _ in
            let textAlert = alertController.textFields?.first
            self.telegramTextField.text = textAlert?.text
        }

        alertController.addTextField { title in
            title.placeholder = "Typing Telegram "
        }

        alertController.addAction(actionCancel)
        alertController.addAction(actionOk)

        present(alertController, animated: true)
    }

    //Общий метод для настройки кнопок Отмена и Добавить
    private func configButton(nameButton: UIButton, text: String) {
        view.addSubview(nameButton)
        nameButton.setTitle(text, for: .normal)
        nameButton.setTitleColor(#colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1), for: .normal)
        nameButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        nameButton.addTarget(self, action: #selector(tapCancel), for: .touchUpInside)
    }

    //Метод задает параметры кнопкам Отмена и Добавить
    private func setupButton() {
        configButton(nameButton: cancelButton, text: "Cancel")
        configButton(nameButton: addButton, text: "Add")
        cancelButton.frame = CGRect(x: 20, y: 20, width: 50, height: 20)
        addButton.frame = CGRect(x: 325, y: 20, width: 30, height: 20)
    }

    //Метод перехода на предыдущий экран при нажатии на кнопку Сancel
    @objc private func tapCancel() {
        dismiss(animated: true)
    }

    //Метод задает параметры для отображения текста в поле ввода даты рождения, после выбора даты в пикере
    @objc private func doneAction() {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        birthTextField.text = formater.string(from: datePicker.date)
        view.endEditing(true)
    }

    //Метод отображения текста для поля Gender
    @objc private func okActionGender() {
        genderTextField.resignFirstResponder()
    }

    //Метод отображения текста  для поля возраста
    @objc private func okAction() {
        ageTextField.resignFirstResponder()
    }
}

//Расширения для реализации протоколов делегата и датасорса

extension InfoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        showAlert()
    }
}

extension InfoViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        if pickerView.accessibilityIdentifier == "agePicker" {
            count = 100
        } else if pickerView.accessibilityIdentifier == "genderPicker" {
            count = 2
        }
        return count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var title = ""

        if pickerView.accessibilityIdentifier == "agePicker" {
            title = String(row)
        } else if pickerView.accessibilityIdentifier == "genderPicker" {
            title = gender[row]
        }
        return title
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.accessibilityIdentifier == "agePicker" {
            ageTextField.text = String(row)
        } else if pickerView.accessibilityIdentifier == "genderPicker" {
            genderTextField.text = gender[row]
        }
    }
}
