//
//  ViewController.swift
//  playerTwo
//
//  Created by Сережа on 10.05.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setSongs()
        configureSubviews()
        
    }
    
    private func setSongs() {
            var heightImage = 80
            var heightLabel = 110
            var heightTime = 110
        
        
        
            for (index, value) in songs.enumerated() {
//                segueSongs(songName: value.name, player: &nextScreen.player)
                
                let btn = UIButton()
                btn.tag = index
                let image = UIImageView()
                image.image = UIImage(named: value.imageName)
                btn.setImage(UIImage(named: value.imageName), for: .normal)
               //btn.setTitle(value.nameArtist, for: .normal)
                //btn.setTitleColor(.brown, for: .normal)
                        btn.frame = CGRect(x: 40, y: heightImage, width: 90, height: 90)
                btn.backgroundColor = UIColor.blue
                btn.addTarget(self, action: #selector(buttonType), for: .touchUpInside)
                view.addSubview(btn)
                
                
                
               // btn.frame = CGRect(x: 50, y: height, width: 100, height: 90)
                heightImage += 120
                
                let labelName = UILabel()
                labelName.textColor = .black
                labelName.text = value.nameArtist
                labelName.frame = CGRect(x: 140, y: heightLabel, width: 180, height: 40)
               // labelName.backgroundColor = UIColor.red
                view.addSubview(labelName)
                heightLabel += 120
                
                let labelTime = UILabel()
                labelTime.textColor = .black
                labelTime.text = value.duration
                labelTime.frame = CGRect(x: 340, y: heightTime, width: 40, height: 40)
                //labelName.backgroundColor = UIColor.systemGray
                view.addSubview(labelTime)
                heightTime += 120
            }
          }
    
//    private lazy var label: UILabel = {
//
//           return label
//       }()

    private func configureSubviews() {
            //view.addSubview(label)
        
            //view.addSubview(startButton)
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
//    nextScreen.imageSong = imageSongThree
//    nextScreen.nameAlbumLowOutlet.text = "Omega"
//    nextScreen.nameAlbumHigtOutlet.text = nextScreen.nameAlbumLowOutlet.text
//    nextScreen.nameSongOutlet.text = "Periphery"

     // print(songs[sender.tag])
//        model.counter += 1
//        label.text = "\(model.counter)"
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

        
        
//final class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureSubviews()
//        setBackground()
//        setSongs()
//    }
//
//    private var model = Model(counter: 0)
//
//    private lazy var label: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.frame = CGRect(x: 90, y: 400, width: 150, height: 80)
//        label.backgroundColor = UIColor.red
//        return label
//    }()
//
//    private lazy var startButton: UIButton = {
//        var btn = UIButton()
//        btn.setTitle("Введите число", for: .normal)
//        btn.setTitleColor(.red, for: .normal)
//        btn.frame = CGRect(x: label.frame.minX + 10, y: 200, width: 150, height: 50)
//        btn.addTarget(self, action: #selector(buttonType), for: .touchUpInside)
//        return btn
//    }()
//
//    var songs: [Song] = [Song(name: "name1", duration: "3.59", imageName: "image1"),
//                         Song(name: "name2", duration: "3.59", imageName: "image1"),
//                         Song(name: "name3", duration: "3.59", imageName: "image1")
//
//    ]
//
//    private func setSongs() {
//        var height = 0
//        for (index, value) in songs.enumerated() {
//            let btn = UIButton()
//            btn.tag = index
//            btn.addTarget(self, action: #selector(buttonType), for: .touchUpInside)
//            let image = UIImageView()
//            image.image = UIImage(named: value.imageName)
//            btn.frame = CGRect(x: 50, y: height, width: 50, height: 30)
//            height += 50
//
//        }
//    }
//
//    private func setBackground() {
//        view.backgroundColor = .blue
//    }
//
//    private func configureSubviews() {
//        view.addSubview(label)
//        view.addSubview(startButton)
//    }
//
//    @objc private func buttonType(sender: UIButton) {
//
//      print(songs[sender.tag])
//        model.counter += 1
//        label.text = "\(model.counter)"
//    }
//
//}
//
//struct Song {
//    let name: String
//    let duration: String
//    let imageName: String
//}
