// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отображаающий экран "слова наоборот"
class ViewController: UIViewController {
    // MARK: - Constants

    let beginButton = UIButton()
    let inputLabel = UILabel(frame: CGRect(x: 50, y: 106, width: 275, height: 57))
    let wordLabel = UILabel(frame: CGRect(x: 50, y: 163, width: 275, height: 57))
    let returnLabel = UILabel(frame: CGRect(x: 50, y: 282, width: 275, height: 57))
    let wordReservedLabel = UILabel(frame: CGRect(x: 50, y: 339, width: 275, height: 57))

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        configBeginLabel(top: 406)
    }

    // MARK: - Private Methods

    //Метод настраивающий кнопку "Начать"
    private func configBeginLabel(top: Int) {
        beginButton.frame = CGRect(x: 20, y: top, width: 335, height: 44)
        view.addSubview(beginButton)
        beginButton.backgroundColor = #colorLiteral(red: 0.3433674574, green: 0.8605665565, blue: 0.4748894572, alpha: 1)
        beginButton.setTitle("Начать", for: .normal)
        beginButton.titleLabel?.textAlignment = .center
        beginButton.tintColor = .white
        beginButton.layer.cornerRadius = 12
        beginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        beginButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    //Метод появление алерта с полем для ввода слова
    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Отмена", style: .default)
        let actionOk = UIAlertAction(title: "Oк", style: .cancel) { _ in
            let word = alertController.textFields?.first
            let result = word?.text

            self.configWordLabel(word: result)
            self.configWordReversedLabel(word: result)
            self.configBeginLabel(top: 598)
            self.configInputLabel()
            self.configReturnLabel()
        }

        alertController.addTextField()
        alertController.addAction(actionCancel)
        alertController.addAction(actionOk)

        present(alertController, animated: true)
    }

    //Метод настройки лейбла  "Вы ввели слово"
    private func configInputLabel() {
        view.addSubview(inputLabel)
        inputLabel.text = "Вы ввели слово"
        inputLabel.textColor = .black
        inputLabel.textAlignment = .center
        inputLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    //Метод настройки лейбла "Что получилось"
    private func configReturnLabel() {
        view.addSubview(returnLabel)
        returnLabel.text = "А вот что получится, если читать справа налево"
        returnLabel.textColor = .black
        returnLabel.textAlignment = .center
        returnLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        returnLabel.numberOfLines = 2
    }

    
    //Метод настройки лейбла, отображающего введенное слово
    private func configWordLabel(word: String?) {
        view.addSubview(wordLabel)
        wordLabel.text = word ?? " "
        wordLabel.backgroundColor = .white
        wordLabel.textColor = .gray
        wordLabel.textAlignment = .center
    }

    //Метод настройки лейбла, отображающего слово наоборот
    private func configWordReversedLabel(word: String?) {
        view.addSubview(wordReservedLabel)
        let inputWord = word ?? " "
        wordReservedLabel.text = String(inputWord.reversed())
        wordReservedLabel.backgroundColor = .white
        wordReservedLabel.textColor = .gray
        wordReservedLabel.textAlignment = .center
    }
}
