//
//  ViewController.swift
//  playerTwo
//
//  Created by Сережа on 10.05.2023.
//

import UIKit
import AVFoundation

class ViewControllerOne: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setSongs()
        configureSubviews()
        
    }
    
    private func setSongs() {
            var heightImage = 80
            var heightLabel = 110
            var heightTime = 110
        
        
        
            for (index, song) in songs.enumerated() {
                
                let btn = UIButton()
                btn.tag = index
                let image = UIImageView()
                image.image = UIImage(named: song.imageName)
                btn.setImage(UIImage(named: song.imageName), for: .normal)
                        btn.frame = CGRect(x: 40, y: heightImage, width: 90, height: 90)
                btn.backgroundColor = UIColor.blue
                btn.addTarget(self, action: #selector(buttonType), for: .touchUpInside)
                view.addSubview(btn)
                heightImage += 120
                
                let labelName = UILabel()
                labelName.textColor = .black
                labelName.text = song.nameArtist
                labelName.frame = CGRect(x: 140, y: heightLabel, width: 180, height: 40)
                view.addSubview(labelName)
                heightLabel += 120
                
                let labelTime = UILabel()
                labelTime.textColor = .black
                labelTime.text = song.duration
                labelTime.frame = CGRect(x: 340, y: heightTime, width: 40, height: 40)
                view.addSubview(labelTime)
                heightTime += 120
            }
          }
    

    private func configureSubviews() {
          
        }

    @IBAction func buttonType(_ sender: UIButton) {
        
        let play = UIStoryboard(name: "Main", bundle: nil)
            guard let nextScreen = play.instantiateViewController(identifier: "viewTwo") as? ViewControllerTwo else { return }
       
        
    self.present(nextScreen, animated: true, completion: nil)
    nextScreen.modalPresentationStyle = .automatic
 
        segueSongs(songName: songs[sender.tag].nameArtist , player: &nextScreen.player)
        nextScreen.nameAlbumLabel.text = songs[sender.tag].nameAlbum
        nextScreen.nameSongLabel.text = songs[sender.tag].nameArtist
        nextScreen.imageSong.image = UIImage(named: songs[sender.tag].imageName)
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


    var songs: [Song] = [Song(nameArtist: "Korn - Black is the soul", duration: "4.41", imageName: "корн.jpeg", nameAlbum: "Serenity"),
                         Song(nameArtist: "Stone Sour - Trought glass", duration: "4.01", imageName: "stone sour.jpeg", nameAlbum: "Pox"),
                         Song(nameArtist: "Periphery - bad thing", duration: "5.54", imageName: "bad thing.jpeg", nameAlbum: "Omega")]
}
    
struct Song {
    let nameArtist: String
    let duration: String
    let imageName: String
    let nameAlbum: String
    
}

        
