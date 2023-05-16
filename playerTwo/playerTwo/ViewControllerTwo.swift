//
//  ViewControllerTwo.swift
//  playerTwo
//
//  Created by Сережа on 10.05.2023.
//

import UIKit
import  AVFoundation

class ViewControllerTwo: UIViewController {
    
    var player = AVAudioPlayer()
    var timer  = Timer()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
    
    
    //MARK: Кнопки
    
    lazy var imageSong: UIImageView = {
       var imageSong = UIImageView()
        imageSong.frame = CGRect(x: 0, y: 180, width: 300, height: 300)
        imageSong.center.x = view.center.x
        return imageSong
    }()
    
    lazy var nameSongLabel: UILabel = {
        var nameSongLabel = UILabel()
        nameSongLabel.frame = CGRect(x: 0, y: 450, width: 150, height: 30)
        nameSongLabel.center.x = view.center.x
        nameSongLabel.text = "Name song"
        return nameSongLabel
    }()
    
    private lazy var timeEndlabel: UILabel = {
        var timeEndlabel = UILabel()
        timeEndlabel.frame = CGRect(x: 300, y: 500, width: 50, height: 20)
        timeEndlabel.text = "Time"
        timeEndlabel.textColor = UIColor.systemGray
        return timeEndlabel
    }()
    
    private lazy var timeStartlabel: UILabel = {
        var timeStartlabel = UILabel()
        timeStartlabel.frame = CGRect(x: 50, y: 500, width: 50, height: 20)
        timeStartlabel.text = "Time"
        timeStartlabel.textColor = UIColor.systemGray
       return timeStartlabel
    }()
    
    
    // MARK: слайдер громкости
    private lazy var sliderVolume: UISlider = {
        var sliderVolume = UISlider()
        sliderVolume.frame = CGRect(x: 0, y: 600, width: 300, height: 10)
        sliderVolume.center.x = view.center.x
        sliderVolume.addTarget(self, action: #selector(sliderVolumeFunc (sender:)), for: .valueChanged)
         return sliderVolume
        
    }()
    
    // MARK: слайдер времени
    private lazy var sliderTimeSong: UISlider = {
        var sliderTimeSong = UISlider()
        sliderTimeSong.frame = CGRect(x: 0, y: 530, width: 300, height: 10)
        sliderTimeSong.center.x = view.center.x
        sliderTimeSong.addTarget(self, action: #selector(timeSliderButton (sender:)), for: .valueChanged)
      
        sliderTimeSong.minimumValue = 0.0
        sliderTimeSong.maximumValue = Float(player.duration)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeSong), userInfo: nil, repeats: true)
        return sliderTimeSong
    }()
    
    //MARK: лейбл альбома сверху
    lazy var nameAlbumLabelOne: UILabel = {
        var nameAlbumLabelOne = UILabel()
        nameAlbumLabelOne.frame = CGRect(x: 0, y: 30, width: 150, height: 20)
        nameAlbumLabelOne.center.x = view.center.x
        nameAlbumLabelOne.text = "Playing from album"
        nameAlbumLabelOne.textColor = UIColor.systemGray
        
        return nameAlbumLabelOne
    }()
    
    // MARK: лейбл альбома снизу
    lazy var nameAlbumLabel: UILabel = {
        var nameAlbumLabel = UILabel()
        nameAlbumLabel.frame = CGRect(x: 0, y: 50, width: 150, height: 20)
        nameAlbumLabel.center.x = view.center.x
        nameAlbumLabel.text = "Name album"
        
        return nameAlbumLabel
    }()
    
    // MARK: кнопка вниз
    private lazy var downButton: UIButton = {
        let downButton = UIButton()
        downButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        downButton.frame = CGRect(x: 40, y: 40, width: 40, height: 40)
        downButton.tintColor = UIColor.systemGray
        downButton.addTarget(self, action: #selector( downButton(sender:)), for: .touchUpInside)
         return downButton
    }()
    
    // MARK: лейбл громкости
    private lazy var volumelabel: UILabel = {
        var volumelabel = UILabel()
        volumelabel.frame = CGRect(x: 0, y: 580, width: 100, height: 15)
        volumelabel.center.x = view.center.x
        volumelabel.text = "Volume"
        volumelabel.textColor = UIColor.systemGray
        return volumelabel
    }()
    
    // MARK: кнопка поделиться
    private lazy var shareButton: UIButton = {
        var shareButton = UIButton()
        shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        shareButton.frame = CGRect(x: 330, y: 40, width: 50, height: 50)
        shareButton.tintColor = UIColor.systemGray
        shareButton.addTarget(self, action: #selector(shareButtonFunc(sender:)), for: .touchUpInside)
        //view.addSubview(shareButton)
        return shareButton
    }()
    
    // MARK: кнопка плей стоп
    private lazy var playPauseButton: UIButton = {
        let playPauseButton = UIButton()
        playPauseButton.setImage(UIImage(systemName: "play"), for: .normal)
        playPauseButton.center.x = view.center.x
        playPauseButton.setTitleColor(.black, for: .normal)
        playPauseButton.frame = CGRect(x: 170, y: 650, width: 40, height: 40)
        playPauseButton.addTarget(self, action: #selector(playPauseButton(sender:)), for: .touchUpInside)
        return playPauseButton
    }()
    
    private lazy var nextSongButton: UIButton = {
        let nextSongButton = UIButton()
        nextSongButton.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        nextSongButton.center.x = view.center.x
        nextSongButton.setTitleColor(.black, for: .normal)
        nextSongButton.frame = CGRect(x: 210, y: 650, width: 40, height: 40)
        //nextSongButton.addTarget(self, action: #selector(playPauseButton(sender:)), for: .touchUpInside)
        return nextSongButton
    }()
    private lazy var previousSongButton: UIButton = {
        let previousSongButton = UIButton()
        previousSongButton.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
        previousSongButton.center.x = view.center.x
        previousSongButton.setTitleColor(.black, for: .normal)
        previousSongButton.frame = CGRect(x: 130, y: 650, width: 40, height: 40)
        //previousSongButton.addTarget(self, action: #selector(playPauseButton(sender:)), for: .touchUpInside)
        return previousSongButton
    }()
    
    private lazy var randomButton: UIButton = {
        let randomButton = UIButton()
        randomButton.setImage(UIImage(systemName: "shuffle"), for: .normal)
        
        randomButton.setTitleColor(.systemGray, for: .normal)
        randomButton.frame = CGRect(x: 90, y: 650, width: 40, height: 40)
        
        return randomButton
    }()
    
    private lazy var repeatButton: UIButton = {
        let repeatButton = UIButton()
        repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
        repeatButton.image(for: .application)
        repeatButton.setTitleColor(.systemGray, for: .normal)
        repeatButton.frame = CGRect(x: 250, y: 650, width: 40, height: 40)
        
        return repeatButton
    }()
    
    
    // MARK: добавление во вьюдидлок
    private func configureSubviews() {
        view.addSubview(volumelabel)
        view.addSubview(shareButton)
        view.addSubview(downButton)
        view.addSubview(nameAlbumLabel)
        view.addSubview(sliderTimeSong)
        view.addSubview(playPauseButton)
        view.addSubview(sliderVolume)
        view.addSubview(timeStartlabel)
        view.addSubview(timeEndlabel)
        view.addSubview(nameSongLabel)
        view.addSubview(imageSong)
        view.addSubview(nameAlbumLabelOne)
        view.addSubview(nextSongButton)
        view.addSubview(previousSongButton)
        view.addSubview(randomButton)
        view.addSubview(repeatButton)
       }
      
    
    // MARK: функции кнопок
    // функция кнопки поделиться
    @objc func shareButtonFunc(sender: UIButton) {
        let active = UIActivityViewController(activityItems: ["www.Vagner.ru"], applicationActivities: nil)
        active.popoverPresentationController?.sourceView = self.view
        self.present(active, animated: true, completion: nil)
        
    }
    
    // кнопка вниз
    @objc func downButton( sender: UIButton) { //не работает
            dismiss(animated: true)
            player.pause()
            
        }
    // временной слайдер песни
    @IBAction func timeSliderButton(sender: UISlider) {
        player.currentTime = TimeInterval(sender.value)
           }
    
    // функция плей стоп
    @objc  func playPauseButton(sender: UIButton) {
        if player.isPlaying {
            player.pause()
            sender.setImage(UIImage(systemName: "play"), for: .normal)
            //playPauseButton.tintColor = .brown
        } else {
            player.play()
            sender.setImage(UIImage(systemName: "pause"), for: .normal)
        }
}
    
    // функция слайдера громкости
    @objc func sliderVolumeFunc (sender: UISlider) {
        player.volume = sliderVolume.value
    }
    
    // функция слайдера песни и время
    @objc func timeSong() {
        sliderTimeSong.value = Float(player.currentTime)
        let timePlay = player.currentTime
        let min = Int(timePlay/60)
        let sec = Int(timePlay.truncatingRemainder(dividingBy: 60))
        timeStartlabel.text = NSString(format: "%02d:%02d", min, sec) as String
        
        let time = player.currentTime - player.duration
        let minEnd = Int(time/60)
        let secEnd = Int(-time.truncatingRemainder(dividingBy: 60))
        timeEndlabel.text = NSString(format: "%02d:%02d", minEnd, secEnd) as String
        
        sliderTimeSong.setValue(Float(self.player.currentTime), animated: true)
        
    }

}
