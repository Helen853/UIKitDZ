// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый класс отображающий плэйлист
final class ListViewController: UIViewController {
    
    // MARK: - Constants
    
    let album = [
        Track(imageName: "cat", autorName: "J. Cole", songName: "Photograph"),
        Track(imageName: "travis", autorName: "Travis Scott", songName: "CANT SAY"),
        Track(imageName: "xxx", autorName: "xxxtentacion", songName: "jocelyn flowers")
    ]
    
    // MARK: - IBOutlets
    
    @IBOutlet private var jcoleImageView: UIImageView!
    @IBOutlet private var songNameLabel: UILabel!
    @IBOutlet private var coleAuthorLabel: UILabel!
    @IBOutlet private var xxxImageView: UIImageView!
    @IBOutlet private var travisImageView: UIImageView!
    @IBOutlet private var travisSongLabel: UILabel!
    @IBOutlet private var travisAuthorLabel: UILabel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tapImage()
    }

    // MARK: - Private Methods
    
    //Метод добавляет распознование жеста при нажатии на картинку трека
    private func tapImage() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(segueToTrack))
        jcoleImageView.addGestureRecognizer(gesture)
        jcoleImageView.isUserInteractionEnabled = true
    }

    //Метод перехода на Экран воспроизведения трека
    @objc private func segueToTrack() {
        _ = UIStoryboard(name: "Main", bundle: nil)
        guard
            let viewControllerYouWantToPresent = storyboard?
            .instantiateViewController(withIdentifier: "TrackViewController"),
            let viewController = viewControllerYouWantToPresent as? TrackViewController
        else { return }

        viewController.view.backgroundColor = .clear
        viewController.setupTrackViewSreen(
            album: album, trackIndex: 0
        )
        navigationController?.present(viewController, animated: true)
    }
}
