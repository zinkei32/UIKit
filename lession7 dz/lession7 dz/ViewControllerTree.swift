//
//  ViewControllerTree.swift
//  lession7 dz
//
//  Created by Сережа on 18.05.2023.
//

import UIKit

class ViewControllerTree: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
    
    
//MARK: лейблы и кнопки
    
    lazy var brendLabel: UILabel = {
       var brendLabel = UILabel()
        brendLabel.frame = CGRect(x: 30, y: 30, width: 150, height: 50)
        //brendLabel.center.x = view.center.x
        brendLabel.font = brendLabel.font.withSize(24)
        brendLabel.textColor = .black
        brendLabel.text = ""
        return brendLabel
    }()
    
    lazy var modelLabel: UILabel = {
       var modelLabel = UILabel()
        modelLabel.frame = CGRect(x: 190, y: 30, width: 150, height: 50)
        //modelLabel.center.x = view.center.x
        modelLabel.font = modelLabel.font.withSize(24)
        modelLabel.textColor = .black
        modelLabel.text = ""
        return modelLabel
    }()
    
    lazy var priceLabel: UILabel = {
       var priceLabel = UILabel()
        priceLabel.frame = CGRect(x: 30, y: 420, width: 150, height: 50)
        //priceLabel.center.x = view.center.x
        priceLabel.font = priceLabel.font.withSize(18)
        priceLabel.textColor = .black
        priceLabel.text = ""
        return priceLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
       var descriptionLabel = UILabel()
        descriptionLabel.frame = CGRect(x: 30, y: 420, width: 150, height: 50)
        //priceLabel.center.x = view.center.x
        descriptionLabel.font = descriptionLabel.font.withSize(20)
        descriptionLabel.textColor = .black
        descriptionLabel.text = "Описание:"
        return descriptionLabel
    }()
    
    lazy var descriptionText: UILabel = {
       var descriptionText = UILabel()
        descriptionText.frame = CGRect(x: 30, y: 480, width: 300, height: 300)
        //priceLabel.center.x = view.center.x
        descriptionText.font = descriptionText.font.withSize(16)
        descriptionText.backgroundColor = .blue
        descriptionText.textColor = .black
        descriptionText.text = """
            
            """
        return descriptionText
    }()
    
    var menuArray = ["1","2","3","4","5","6"]
    
    private lazy var segmentControlImage: UISegmentedControl = {
        var segmentControlImage = UISegmentedControl()
        segmentControlImage = UISegmentedControl(items: self.menuArray )
        segmentControlImage.frame = CGRect(x: 100, y: 360, width: 200, height: 30)
        segmentControlImage.addTarget(self, action: #selector(selectValue), for: .valueChanged)
         return segmentControlImage
    }()
    
    var imageArray = [UIImage(named: "rav1.jpg"), UIImage(named:  "rav2.jpg"),UIImage(named:  "rav3.jpg")]
    
    lazy var imagesCar: UIImageView = {
        var imagesCar = UIImageView()
        imagesCar.frame = CGRect(x: 0, y: 80, width: 320, height: 264)
        imagesCar.center.x = view.center.x
        imagesCar.image = self.imageArray[0]
        
        return imagesCar
}()

@objc func selectValue(target: UISegmentedControl) {
    if target == self.segmentControlImage {
        let segmentIndex = target.selectedSegmentIndex
        self.imagesCar.image = self.imageArray[segmentIndex]
        let index = target.titleForSegment(at: segmentIndex)
        print(index ?? "")
}
}
    
    

    private func configureSubviews() {
        view.addSubview(brendLabel)
        view.addSubview(imagesCar)
        view.addSubview(segmentControlImage)
        view.addSubview(modelLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(descriptionText)
//        view.addSubview(timeStartlabel)
//        view.addSubview(timeEndlabel)
//        view.addSubview(nameSongLabel)
//        view.addSubview(imageSong)

}
}
