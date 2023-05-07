//
//  ViewController.swift
//  Player
//
//  Created by Сережа on 02.05.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
   
    @IBOutlet weak var nameSongOne: UIButton!
    
    @IBOutlet weak var imageSongOne: UIImageView!
    @IBOutlet weak var timeSongOne: UILabel!
    
    
    @IBOutlet weak var nameSongTwo: UIButton!
    @IBOutlet weak var imageSongTwo: UIImageView!
    @IBOutlet weak var timeSongTwo: UILabel!
    
    @IBOutlet weak var nameSongThree: UIButton!
    @IBOutlet weak var imageSongThree: UIImageView!
    @IBOutlet weak var timeSongThree: UILabel!
    
    @IBOutlet weak var playListLabel: UILabel!
    
    
   
    var image = UIImage(named: "stone sour.jpeg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSongOne.image = image
        nameSongOne.setTitle("Stone sour", for: .normal)
        timeSongOne.text = "4:41"
       // imageSongOne.image = UIImage(named: "stone sour")
        imageSongOne.layer.cornerRadius = 2
        
        
        nameSongTwo.setTitle("Korn-Black Is The Soul", for: .normal)
        timeSongTwo.text = "4:01"
        imageSongTwo.image = UIImage(named:"корн.jpeg")
        
        
        nameSongThree.setTitle("Periphery - The Bad Thing", for: .normal)
        timeSongThree.text = "5:54"
        imageSongThree.image = UIImage(systemName: "bad thing")
               // (named: "bad thing.jpeg")
        
    }
    

    
    @IBAction func buttonSongOne(_ sender: UIButton) {
        let play = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = play.instantiateViewController(identifier: "viewTwo") as? ViewControllerTwo else { return }
        self.present(nextScreen, animated: true, completion: nil)
        nextScreen.modalPresentationStyle = .automatic
        segueSongs(songName: "Stone Sour", player: &nextScreen.player)
        nextScreen.imageSong.image = UIImage(named: "stone sour.jpeg")
        nextScreen.nameAlbumLowOutlet.text = "Come What(ever) May"
        nextScreen.nameAlbumHigtOutlet.text = nextScreen.nameAlbumLowOutlet.text
        nextScreen.nameSongOutlet.text = "Stone sour"
        
    }
    
    @IBAction func buttonSongTwo(_ sender: UIButton) {
        let play = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = play.instantiateViewController(identifier: "viewTwo") as? ViewControllerTwo else { return }
        self.present(nextScreen, animated: true, completion: nil)
        nextScreen.modalPresentationStyle = .automatic
        segueSongs(songName: "Korn", player: &nextScreen.player)
        nextScreen.imageSong = imageSongTwo
        nextScreen.nameAlbumLowOutlet.text = "The Serenity of Suffering"
        nextScreen.nameAlbumHigtOutlet.text = nextScreen.nameAlbumLowOutlet.text
        nextScreen.nameSongOutlet.text = "Korn"
    }
    
    @IBAction func buttonSongThree(_ sender: UIButton) {
        let play = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = play.instantiateViewController(identifier: "viewTwo") as? ViewControllerTwo else { return }
        self.present(nextScreen, animated: true, completion: nil)
        nextScreen.modalPresentationStyle = .automatic
        segueSongs(songName: "Periphery", player: &nextScreen.player)
        nextScreen.imageSong = imageSongThree
        nextScreen.nameAlbumLowOutlet.text = "Omega"
        nextScreen.nameAlbumHigtOutlet.text = nextScreen.nameAlbumLowOutlet.text
        nextScreen.nameSongOutlet.text = "Periphery"
        
    }
    
    
    
    func segueSongs (songName: String, player: inout AVAudioPlayer) {
        do {
            if let audioPath = Bundle.main.path(forResource: songName, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
            } catch  {
                print("где то косяк")
            }
            player.play()
        }
    }


