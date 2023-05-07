//
//  ViewController.swift
//  UISlider
//
//  Created by Сережа on 02.05.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderVol: UISlider!
    
    
    var player = AVAudioPlayer()
    var slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            // slider
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100.00
        self.view.addSubview(slider)
        
        //add target
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "Periphery - The Bad Thing", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Не вышло")
        }
        
        self.player.play()
       
    }
    
    //MARK: - привязка к слайдеру
    @objc func  changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    @IBAction func slider(_ sender: Any) {
        self.player.volume = self.sliderVol.value
    }
    
}

