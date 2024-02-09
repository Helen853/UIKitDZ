// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class ViewController: UIViewController {
    
    // MARK: - Constants
    let headerImageView = UIImageView(frame: CGRect(x: 0, y: 37, width: 375, height: 818))
    let grettingLabel = UILabel(frame: CGRect(x: 0, y: 37, width: 375, height: 82))
    let guessNumberButton = UIButton(frame: CGRect(x: 82, y: 301, width: 150, height: 150))
    let calculatorButton = UIButton(frame: CGRect(x: 132, y: 507, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        configHeaderImageView()
        configLabel()
        configButton(nameButton: calculatorButton, title: "Калькулятор")
        configButton(nameButton: guessNumberButton, title: "Угадай число")
        configColorButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        showAlertInputName()
        actionCalculatorButton()
        actionGuessNumberButton()
    }

    func configHeaderImageView() {
        view.addSubview(headerImageView)
        headerImageView.image = UIImage(named: "Background")
    }

    func configLabel() {
        view.addSubview(grettingLabel)
        grettingLabel.text = "Приветствую, \n"
        grettingLabel.textAlignment = .center
        grettingLabel.textColor = .white
        grettingLabel.backgroundColor = #colorLiteral(red: 0.6520287395, green: 0.83409518, blue: 0.91873914, alpha: 1)
        grettingLabel.font = UIFont(name: "Verdana", size: 30)
        grettingLabel.numberOfLines = 2
        grettingLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }

    func configButton(nameButton: UIButton, title: String) {
        view.addSubview(nameButton)
        nameButton.setTitle(title, for: .normal)
        nameButton.layer.cornerRadius = 30
        nameButton.titleLabel?.textAlignment = .center
        nameButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    func configColorButton() {
        calculatorButton.backgroundColor = #colorLiteral(red: 0.3921568627, green: 0.7098039216, blue: 0.5098039216, alpha: 1)
        guessNumberButton.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.4980392157, blue: 0.7098039216, alpha: 1)
    }

    func actionCalculatorButton() {
        calculatorButton.addTarget(self, action: #selector(showAlertInputNumber), for: .touchUpInside)
    }

    func actionGuessNumberButton() {
        guessNumberButton.addTarget(self, action: #selector(showAlertGuessNumber), for: .touchUpInside)
    }

    func showAlertInputName() {
        let alertController = UIAlertController(
            title: "Пожалуйста \n представьтесь ",
            message: nil,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            let textAlert = alertController.textFields?.first
            self.grettingLabel.text! += (textAlert?.text!)! + "!"
        }

        alertController.addTextField { title in
            title.placeholder = "Введите имя"
        }

        alertController.addAction(action)
        present(alertController, animated: true)
    }

    @objc func showAlertInputNumber() {
        let alertController = UIAlertController(
            title: "Введите ваши числа",
            message: nil,
            preferredStyle: .alert
        )

        let actionChange = UIAlertAction(title: "Выбрать операцию", style: .default) { _ in
            let numOne = alertController.textFields?.first
            let numTwo = alertController.textFields?[1]
            let sum = (Int(numOne?.text ?? "0") ?? 0) + (Int(numTwo?.text ?? "0") ?? 0)
            let sub = (Int(numOne?.text ?? "0") ?? 0) - (Int(numTwo?.text ?? "0") ?? 0)
            let mult = (Int(numOne?.text ?? "0") ?? 0) * (Int(numTwo?.text ?? "0") ?? 0)
            let div = (Int(numOne?.text ?? "0") ?? 0) / (Int(numTwo?.text ?? "0") ?? 1)

            self.showAlertAction(sum: sum, sub: sub, mult: mult, div: div)
        }

        let actionCancel = UIAlertAction(title: "Отмена", style: .default)

        alertController.addTextField { title in
            title.placeholder = "Число 1"
        }
        alertController.addTextField { title in
            title.placeholder = "Число 2"
        }

        alertController.addAction(actionChange)
        alertController.addAction(actionCancel)

        present(alertController, animated: true)
    }

    func showAlertAction(sum: Int, sub: Int, mult: Int, div: Int) {
        let alertController = UIAlertController(
            title: "Выберите математическую операцию",
            message: nil,
            preferredStyle: .alert
        )

        let sum = UIAlertAction(title: "Сложить", style: .default) { _ in
            self.showResultAlert(result: sum)
        }

        let subtract = UIAlertAction(title: "Вычесть", style: .default) { _ in
            self.showResultAlert(result: sub)
        }

        let multiply = UIAlertAction(title: "Умножить", style: .default) { _ in
            self.showResultAlert(result: mult)
        }

        let divide = UIAlertAction(title: "Разделить", style: .default) { _ in
            self.showResultAlert(result: div)
        }

        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)

        alertController.addAction(sum)
        alertController.addAction(subtract)
        alertController.addAction(multiply)
        alertController.addAction(divide)
        alertController.addAction(actionCancel)

        present(alertController, animated: true)
    }

    func showResultAlert(result: Int) {
        let alertController = UIAlertController(title: "Ваш результат", message: String(result), preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Отмена", style: .default)
        let actionOk = UIAlertAction(title: "Ok", style: .cancel)

        alertController.addAction(actionCancel)
        alertController.addAction(actionOk)
        present(alertController, animated: true)
    }

    @objc func showAlertGuessNumber() {
        let alertController = UIAlertController(
            title: "Угадай число от 1 до 10",
            message: nil,
            preferredStyle: .alert
        )

        let actionCancel = UIAlertAction(title: "Отмена", style: .default)
        let actionOk = UIAlertAction(
            title: "Ok",
            style: .cancel,
            handler: { _ in
                let inputNumber = alertController.textFields?.first
                let randomNum = Int.random(in: 1 ... 10)
                if randomNum == Int(inputNumber?.text ?? "0") {
                    self.showAlertTrue(title: "Поздравляю!", message: "Вы угадали число")
                } else {
                    self.showAlertTrue(title: "Упс!", message: "Это неверный ответ")
                }
            }
        )

        alertController.addTextField { title in
            title.placeholder = "Введите число"
        }

        alertController.addAction(actionCancel)
        alertController.addAction(actionOk)
        present(alertController, animated: true)
    }

    func showAlertTrue(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let actionOk = UIAlertAction(title: "Ok", style: .cancel)

        alertController.addAction(actionOk)
        present(alertController, animated: true)
    }
}
