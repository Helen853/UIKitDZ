// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class ViewController: UIViewController {
    lazy var headerImageView = UIImageView(frame: CGRect(x: 0, y: 37, width: 375, height: 818))
    var grettingLabel = UILabel(frame: CGRect(x: 0, y: 37, width: 375, height: 82))
    var guessNumberButton = UIButton(frame: CGRect(x: 82, y: 301, width: 150, height: 150))
    var calculatorButton = UIButton(frame: CGRect(x: 132, y: 507, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        showAlert()
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
        showAlert()
    }

    func configHeaderImageView() {
        view.addSubview(headerImageView)
        headerImageView.image = UIImage(named: "Background")
    }

    func configLabel() {
        view.addSubview(grettingLabel)
        grettingLabel.text = "Приветствую, \n"
        grettingLabel.textAlignment = .center
        // grettingLabel.font = grettingLabel.font.withSize(30)
        grettingLabel.textColor = .white
        // grettingLabel.font = grettingLabel.font.fontName
        grettingLabel.backgroundColor = #colorLiteral(red: 0.6520287395, green: 0.83409518, blue: 0.91873914, alpha: 1)
        grettingLabel.font = UIFont(name: "Verdana", size: 30)
        grettingLabel.numberOfLines = 2
        grettingLabel.font = UIFont.boldSystemFont(ofSize: 30)
        //grettingLabel.font = UIFont.fontNames(forFamilyName: "Verdana")
    }

    func configButton(nameButton: UIButton, title: String) {
        view.addSubview(nameButton)
        nameButton.setTitle(title, for: .normal)
        nameButton.layer.cornerRadius = 30
        nameButton.titleLabel?.font = nameButton.titleLabel?.font.withSize(20)
        nameButton.titleLabel?.textAlignment = .center
    }

    func configColorButton() {
        calculatorButton.backgroundColor = #colorLiteral(red: 0.3921568627, green: 0.7098039216, blue: 0.5098039216, alpha: 1)
        guessNumberButton.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.4980392157, blue: 0.7098039216, alpha: 1)
    }

    func showAlert() {
        let alertController = UIAlertController(
            title: "Пожалуйста \n представьтесь ",
            message: nil,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            let textAlert = alertController.textFields?.first
            self.grettingLabel.text! += (textAlert?.text!)! + "!"
        }

        alertController.addTextField { _ in }
        // alertController.textFields?.append(
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    
}
