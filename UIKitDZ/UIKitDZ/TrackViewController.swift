// TrackViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

//Класс отображающий проигрывание трека
final class TrackViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private var trackImageView: UIImageView!

    @IBOutlet private var nameTrackLabel: UILabel!

    @IBOutlet private var nameSingLabel: UILabel!

    @IBOutlet private var longSingLabel: UILabel!

    @IBOutlet private var longTrackSlider: UISlider!

    @IBOutlet private var playButton: UIButton!

    @IBOutlet private var closeButton: UIButton!

    @IBOutlet private var valumeSlider: UISlider! {
        didSet {
            valumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        }
    }
    
    // MARK: - Private Properties
    
    private var player = AVAudioPlayer()
    private var isPlay = false
    private var album: [Track] = []
    private var currentTrackIndex = 0

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        longTrackSlider.value = 0.0
        setupItem()
    }

    // MARK: - Public Methods
    
    //Метод настройки составляющих трека (картинка, автор, название песни)
    func setupTrackViewSreen(album: [Track], trackIndex: Int) {
        self.album = album
        currentTrackIndex = trackIndex
        trackImageView.image = UIImage(named: album[trackIndex].imageName)
        nameTrackLabel.text = album[trackIndex].autorName
        nameSingLabel.text = album[trackIndex].songName
    }
    
    // MARK: - IBAction

    //Метод задает громкость плееру
    @IBAction private func switchVolume(_ sender: Any) {
        player.volume = valumeSlider.value
    }

    //Метод воспроизводит трек
    @IBAction private func playSing(_ sender: Any) {
        playTrack()
    }
    
    //Метод задает значение слайдеру в зависимости от дительности трека
    @IBAction private func rewindSing(_ sender: UISlider) {
        longTrackSlider.minimumValue = 0.0
        if sender == longTrackSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    //Метод переключения треков
    @IBAction private func switchTrack(_ sender: Any) {
        if currentTrackIndex < album.count - 1 {
            currentTrackIndex += 1
        } else {
            currentTrackIndex = 0
        }

        trackImageView.image = UIImage(named: album[currentTrackIndex].imageName)
        nameTrackLabel.text = album[currentTrackIndex].autorName
        nameSingLabel.text = album[currentTrackIndex].songName

        playTrack()
    }

    //Метод перехода на предыдущий экран при нажатии на крестик
    @IBAction private func closeView(_ sender: Any) {
        dismiss(animated: true)
    }

    // MARK: - Private Methods
    
    //Метод воспроизведения трека при нажатии на кнопку плей и его настройка
    private func playTrack() {
        let nameTrackLabelText = album[currentTrackIndex].autorName
        let nameSingLabelText = album[currentTrackIndex].songName
        do {
            if let audioPath = Bundle.main.path(
                forResource: "\(nameTrackLabelText) - \(nameSingLabelText)",
                ofType: "mp3"
            ) {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                longTrackSlider.maximumValue = Float(player.duration)
                let timer = Timer(timeInterval: 0.5, target: self, selector: #selector(setupItem), userInfo: nil, repeats: true)
                RunLoop.main.add(timer, forMode: .common)
            }
        } catch {
            print("Error")
        }

        switch isPlay {
        case false:
            player.play()
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            isPlay = true
        case true:
            player.pause()
            playButton.setImage(UIImage(named: "play"), for: .normal)
            isPlay = false
        }
    }

    
// Метод задает параметры лейблу и показывает время воспроизведения трека
    @objc private func setupItem() {
        let currentTime = Int(player.currentTime)
            let minutes = currentTime/60
            let seconds = currentTime - minutes * 60
            longSingLabel.text = NSString(format: "%02d:%02d", minutes,seconds) as String
    }
}
