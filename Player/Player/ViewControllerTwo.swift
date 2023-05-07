//
//  ViewControllerTwo.swift
//  Player
//
//  Created by Сережа on 02.05.2023.
//

import UIKit
import AVFoundation

class ViewControllerTwo: UIViewController {

    @IBOutlet weak var imageSong: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var sliderVol: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeStart: UILabel!
    @IBOutlet weak var timeEnd: UILabel!
    @IBOutlet weak var nameAlbumHigtOutlet: UILabel!
    @IBOutlet weak var nameAlbumLowOutlet: UILabel!
    @IBOutlet weak var nameSongOutlet: UILabel!
    
    
    
    var player = AVAudioPlayer()
    var timer  = Timer()
    var songList = ["Stone Sour","Korn","Periphery"]
    var nubmerSong = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timeSlider.addTarget(self, action: #selector(timeSliderButton(_ :)), for: .valueChanged)
        timeSlider.minimumValue = 0.0
        timeSlider.maximumValue = Float(player.duration)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeSong), userInfo: nil, repeats: true)

    }
    
    
    
    @IBAction func nextSongButton(_ sender: UIButton) {
        if nubmerSong == 0 {
            nubmerSong += 1
            imageSong.image = UIImage(named: "корн.jpeg")
            nameAlbumLowOutlet.text = "The Serenity of Suffering"
           nameAlbumHigtOutlet.text = nameAlbumLowOutlet.text
            nameSongOutlet.text = "Korn"
        } else if nubmerSong == 1 {
            nubmerSong += 1
            imageSong.image = UIImage(named: "bad thing.jpeg")
            nameAlbumLowOutlet.text = "Omega"
            nameAlbumHigtOutlet.text = nameAlbumLowOutlet.text
            nameSongOutlet.text = "Periphery"
           
        } else {
            nubmerSong = 0
            imageSong.image = UIImage(named: "stone sour.jpeg")
           nameAlbumLowOutlet.text = "Come What(ever) May"
           nameAlbumHigtOutlet.text = nameAlbumLowOutlet.text
            nameSongOutlet.text = "Stone sour"
        }
        let songPath = Bundle.main.path(forResource: songList[nubmerSong], ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: songPath!))
        self.player.play()
    }
    
    
    @IBAction func backSongButton(_ sender: UIButton) {
        if nubmerSong == 0 {
            nubmerSong += 1
            imageSong.image = UIImage(named: "корн.jpeg")
            nameAlbumLowOutlet.text = "The Serenity of Suffering"
           nameAlbumHigtOutlet.text = nameAlbumLowOutlet.text
            nameSongOutlet.text = "Korn"
        } else if nubmerSong == 1 {
            nubmerSong += 1
            imageSong.image = UIImage(named: "bad thing.jpeg")
            nameAlbumLowOutlet.text = "Omega"
            nameAlbumHigtOutlet.text = nameAlbumLowOutlet.text
            nameSongOutlet.text = "Periphery"
           
        } else {
            nubmerSong = 0
            imageSong.image = UIImage(named: "stone sour.jpeg")
           nameAlbumLowOutlet.text = "Come What(ever) May"
           nameAlbumHigtOutlet.text = nameAlbumLowOutlet.text
            nameSongOutlet.text = "Stone sour"
        }
        let songPath = Bundle.main.path(forResource: songList[nubmerSong], ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: songPath!))
        self.player.play()
    }
    
    
    @objc func timeSong() {
        timeSlider.value = Float(player.currentTime)
        let timePlay = player.currentTime
        let min = Int(timePlay/60)
        let sec = Int(timePlay.truncatingRemainder(dividingBy: 60))
        timeStart.text = NSString(format: "%02d:%02d", min, sec) as String
        
        let time = player.currentTime - player.duration
        let minEnd = Int(time/60)
        let secEnd = Int(-time.truncatingRemainder(dividingBy: 60))
        timeEnd.text = NSString(format: "%02d:%02d", minEnd, secEnd) as String
        
        timeSlider.setValue(Float(self.player.currentTime), animated: true)
        
    }
    
    
    @IBAction func timeSliderButton(_ sender: UISlider) {
        player.currentTime = TimeInterval(sender.value)
           }
    
    
    @IBAction func shareButton(_ sender: UIButton) {
        let active = UIActivityViewController(activityItems: ["www.Vagner.ru"], applicationActivities: nil)
        active.popoverPresentationController?.sourceView = self.view
        self.present(active, animated: true, completion: nil)
        
    }
    
    
    @IBAction func downButton(_ sender: UIButton) {
        dismiss(animated: true)
        player.pause()
        
    }
    
    @IBAction func sliderVolume(_ sender: UIButton) {
        player.volume = sliderVol.value
    }
    
    @IBAction func playPauseButton(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            sender.setImage(UIImage(systemName: "play"), for: .normal)
           // playButton.tintColor = .brown
        } else {
            player.play()
            sender.setImage(UIImage(systemName: "pause"), for: .normal)
           // playButton.tintColor = .brown
        }
    }
}
