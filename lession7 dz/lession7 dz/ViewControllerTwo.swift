//
//  ViewControllerTwo.swift
//  lession7 dz
//
//  Created by Сережа on 18.05.2023.
//

import UIKit

class ViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addCar()
    }
    
    private func addCar() {
    
        var heightImage = 80
        var heightBrend = 80
        var heightModel = 80

        
        
        for (index, value) in cars.enumerated() {

            
            let btn = UIButton()
            btn.tag = index
            let image = UIImageView()
            image.image = UIImage(named: value.photo)
            btn.setImage(UIImage(named: value.photo), for: .normal)
            //btn.setTitle(value.brend, for: .normal)
            //btn.setTitleColor(.brown, for: .normal)
            btn.frame = CGRect(x: 30, y: heightImage, width: 150, height: 120)
            btn.backgroundColor = UIColor.blue
            btn.layer.cornerRadius = 9
           // btn.addTarget(self, action: #selector(buttonType), for: .touchUpInside)
            view.addSubview(btn)
            heightImage += 140
            
            let brendlabel = UILabel()
            brendlabel.textColor = .black
            brendlabel.text = value.brend
            brendlabel.frame = CGRect(x: 185, y: heightBrend, width: 140, height: 40)
            brendlabel.font = brendlabel.font.withSize(20)
            view.addSubview(brendlabel)
            heightBrend += 140
            
            let modellabel = UILabel()
            modellabel.textColor = .black
            modellabel.text = value.model
            modellabel.frame = CGRect(x: 270, y: heightModel, width: 140, height: 40)
            modellabel.font = modellabel.font.withSize(20)
            //labelName.backgroundColor = UIColor.systemGray
            view.addSubview(modellabel)
            heightModel += 140
        }
    }
    
private func configureSubviews() {
    
}
    
    



    var cars: [Car] = [Car(brend: "Toyota", model: "Rav4", year: "2014", color: "Blue", photo: "ravBlue.jpg"),
                     Car(brend: "Toyota", model: "Rav4", year: "2009", color: "Gold",photo: "ravGold.jpg"),
                     Car(brend: "Toyota", model: "Alphard", year: "2004", color: "White",photo: "Alphard.jpeg")]
}

struct Car {
let brend: String
let model: String
let year: String
let color: String
let photo: String

}

    
