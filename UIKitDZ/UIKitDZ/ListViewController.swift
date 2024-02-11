// ListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ListViewController: UIViewController {
    let headerLabel = UILabel()

    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thridImageView = UIImageView()
    let fourthImageView = UIImageView()

    let firstNameLabel = UILabel()
    let secondNameLabel = UILabel()
    let thridNameLabel = UILabel()
    let fourthNameLabel = UILabel()

    let firstBirthdayLabel = UILabel()
    let secondBirthdayLabel = UILabel()
    let thridBirthdayLabel = UILabel()
    let fourthBirthdayLabel = UILabel()

    let firstCountDaysLabel = UILabel()
    let secondCountDaysLabel = UILabel()
    let thridCountDaysLabel = UILabel()
    let fourthCountDaysLabel = UILabel()

    let cakeImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        configHeaderLabel()
        configImageView()
        configName()
        configPlusButton()
        setUpInfoBirthday()
        setUpCountDays()
        configCakeImage()
    }
    
    func configHeaderLabel() {
        view.addSubview(headerLabel)
        headerLabel.frame = CGRect(x: 100, y: 65, width: 209, height: 20)
        headerLabel.text = "Birthday Reminder"
        headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

    func configPlusButton() {
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(tapPlusButton)
        )
        navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
    }

    @objc func tapPlusButton() {
        let info = InfoViewController()
        info.view.backgroundColor = .white
        navigationController?.present(info, animated: true)
    }

    func configAvatar(nameImageView: UIImageView, nameImage: String, top: CGFloat) {
        view.addSubview(nameImageView)
        nameImageView.frame = CGRect(x: 19, y: top, width: 75, height: 75)
        nameImageView.image = UIImage(named: nameImage)
        nameImageView.layer.cornerRadius = nameImageView.frame.width / 2
    }

    func configNameLabel(nameLabel: UILabel, top: CGFloat, name: String) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 102, y: top, width: 209, height: 20)
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    func configInfoBirthday(nameLabel: UILabel, top: CGFloat, text: String) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 102, y: top, width: 209, height: 20)
        nameLabel.text = text
        nameLabel.font = nameLabel.font.withSize(14)
    }

    func configCountDays(nameLabel: UILabel, top: CGFloat, text: String) {
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 315, y: top, width: 42, height: 44)
        nameLabel.text = text
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.textColor = #colorLiteral(red: 0.4306637049, green: 0.3503972888, blue: 0.6471487284, alpha: 1)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
    }

    func configImageView() {
        configAvatar(
            nameImageView: firstImageView,
            nameImage: "Эллипс 2",
            top: 105
        )
        configAvatar(
            nameImageView: secondImageView,
            nameImage: "Эллипс 2-2",
            top: 200
        )
        configAvatar(
            nameImageView: thridImageView,
            nameImage: "Эллипс 2-3",
            top: 295
        )
        configAvatar(
            nameImageView: fourthImageView,
            nameImage: "Эллипс 2-4",
            top: 390
        )
    }

    func configName() {
        configNameLabel(nameLabel: firstNameLabel, top: 119, name: "Helena Link")
        configNameLabel(nameLabel: secondNameLabel, top: 214, name: "Verona Tusk")
        configNameLabel(nameLabel: thridNameLabel, top: 309, name: "Alex Smith")
        configNameLabel(nameLabel: fourthNameLabel, top: 404, name: "Tom Johnson")
    }

    func setUpInfoBirthday() {
        configInfoBirthday(
            nameLabel: firstBirthdayLabel,
            top: 147,
            text: "10.03 - turns 25!"
        )
        configInfoBirthday(
            nameLabel: secondBirthdayLabel,
            top: 242,
            text: "20.03 - turns 39"
        )
        configInfoBirthday(
            nameLabel: thridBirthdayLabel,
            top: 337,
            text: "21.04 - turns 51"
        )
        configInfoBirthday(
            nameLabel: fourthBirthdayLabel,
            top: 432,
            text: "05.06 - turns 18"
        )
    }

    func setUpCountDays() {
        configCountDays(
            nameLabel: secondCountDaysLabel,
            top: 214,
            text: "10 \n days"
        )
        configCountDays(
            nameLabel: thridCountDaysLabel,
            top: 309,
            text: "42 \n days"
        )
        configCountDays(
            nameLabel: fourthCountDaysLabel,
            top: 404,
            text: "87 \n days"
        )
    }

    func configCakeImage() {
        view.addSubview(cakeImageView)
        cakeImageView.frame = CGRect(x: 314, y: 119, width: 44, height: 44)
        cakeImageView.image = UIImage(named: "image-4")
    }
}
