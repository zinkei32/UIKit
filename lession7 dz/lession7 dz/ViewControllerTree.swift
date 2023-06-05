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
    
    private lazy var shareButton: UIButton = {
       var shareButton = UIButton()
        shareButton.frame = CGRect(x:280 , y: 35, width: 40, height: 40)
        shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
        shareButton.tintColor = UIColor.systemGray
        shareButton.addTarget(self, action: #selector(shareButton(sender:)), for: .touchUpInside)
        return shareButton
    }()
    
    lazy var brendLabel: UILabel = {
       var brendLabel = UILabel()
        brendLabel.frame = CGRect(x: 30, y: 30, width: 150, height: 50)
        brendLabel.font = brendLabel.font.withSize(24)
        brendLabel.textColor = .black
        brendLabel.text = ""
        return brendLabel
    }()
    
    lazy var modelLabel: UILabel = {
       var modelLabel = UILabel()
        modelLabel.frame = CGRect(x: 190, y: 30, width: 150, height: 50)
        modelLabel.font = modelLabel.font.withSize(24)
        modelLabel.textColor = .black
        modelLabel.text = ""
        return modelLabel
    }()
    
    lazy var priceLabel: UILabel = {
       var priceLabel = UILabel()
        priceLabel.frame = CGRect(x: 30, y: 420, width: 150, height: 50)
        priceLabel.font = priceLabel.font.withSize(18)
        priceLabel.textColor = .black
        priceLabel.text = ""
        return priceLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
       var descriptionLabel = UILabel()
        descriptionLabel.frame = CGRect(x: 30, y: 420, width: 150, height: 50)
        descriptionLabel.font = descriptionLabel.font.withSize(20)
        descriptionLabel.textColor = .black
        descriptionLabel.text = "Описание:"       //как то надо его поправить
        return descriptionLabel
    }()
    
    lazy var descriptionText: UILabel = {
       var descriptionText = UILabel()
        descriptionText.frame = CGRect(x: 30, y: 480, width: 300, height: 300)
        descriptionText.font = descriptionText.font.withSize(14)
        descriptionText.numberOfLines = 0
        descriptionText.textColor = .black
        descriptionText.text =
        """
        """
        return descriptionText
    }()
    
    private lazy var segmentControlImage: UISegmentedControl = {
        var segmentControlImage = UISegmentedControl()
        var menuArray = ["1","2","3","4","5","6"]
        segmentControlImage = UISegmentedControl(items: menuArray )
        segmentControlImage.frame = CGRect(x: 100, y: 360, width: 200, height: 30)
        segmentControlImage.addTarget(self, action: #selector(selectValue), for: .valueChanged)
         return segmentControlImage
    }()
    
    lazy var imagesCar: UIImageView = { // как сюда подтянуть изображения из viewTwo что оно открывалось сразу при запуске
        var imagesCar = UIImageView()
        imagesCar.frame = CGRect(x: 0, y: 80, width: 320, height: 264)
        imagesCar.center.x = view.center.x
        //imagesCar.image = UIImage(named: firstScreenq.cars[target.tag].photos[0])
        return imagesCar
}()
    
        
        @objc func shareButton(sender: UIButton) {
            let active = UIActivityViewController(activityItems: [self.brendLabel.text ?? "nil"], applicationActivities: nil)
            active.popoverPresentationController?.sourceView = self.view
            self.present(active, animated: true, completion: nil)
        }
            
    
        @objc func selectValue(target: UISegmentedControl) {
    
           let play = UIStoryboard(name: "Main", bundle: nil)
           guard let firstScreen = play.instantiateViewController(identifier: "viewTwo") as? ViewControllerTwo else { return }
   
    if target == self.segmentControlImage {
        let segmentIndex = target.selectedSegmentIndex
        self.imagesCar.image = UIImage(named: firstScreen.cars[target.tag].photos[segmentIndex])
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
        view.addSubview(shareButton)

    }
}
