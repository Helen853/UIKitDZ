// InfoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class InfoViewController: UIViewController {
    // MARK: - Public Methods

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(
            title: "Выставить счет?",
            message: nil,
            preferredStyle: .alert
        )
        let actionCancel = UIAlertAction(title: "Отмена", style: .default)
        let actionCheck = UIAlertAction(title: "Чек", style: .default) { _ in

            _ = UIStoryboard(name: "Main", bundle: nil)
            guard
                let viewControllerYouWantToPresent = self.storyboard?
                .instantiateViewController(withIdentifier: "CheckViewController")
            else { return }

            self.navigationController?.pushViewController(viewControllerYouWantToPresent, animated: true)
        }

        alertController.addAction(actionCancel)
        alertController.addAction(actionCheck)

        present(alertController, animated: true)
    }
}
