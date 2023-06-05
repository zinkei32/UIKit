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
        configureSubviews()
    }
    
    private func addCar() {
    
        var heightImage = 80
        var heightBrend = 80
        var heightModel = 80
        var heightColor = 110
        var heightPrice = 110

        
        
        for (index, value) in cars.enumerated() {

            
            let btn = UIButton()
            btn.tag = index
            let image = UIImageView()
            image.image = UIImage(named: value.photo)
            btn.setImage(UIImage(named: value.photo), for: .normal)
            btn.frame = CGRect(x: 30, y: heightImage, width: 150, height: 120)
            btn.backgroundColor = UIColor.blue
            btn.layer.cornerRadius = 9
           btn.addTarget(self, action: #selector(buttonType), for: .touchUpInside)
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
            
            
            let colorlabel = UILabel()
            colorlabel.textColor = .black
            colorlabel.text = value.color
            colorlabel.frame = CGRect(x: 185, y: heightColor, width: 140, height: 40)
            colorlabel.font = colorlabel.font.withSize(16)
            view.addSubview(colorlabel)
            heightColor += 140
            
            let pricelabel = UILabel()
            pricelabel.textColor = .black
            pricelabel.text = value.price
            pricelabel.frame = CGRect(x: 270, y: heightPrice, width: 140, height: 40)
            pricelabel.font = pricelabel.font.withSize(16)
            view.addSubview(pricelabel)
            heightPrice += 140
        
        }
        
    }
    
    private lazy var addCarButton: UIButton = {
        var addCarButton = UIButton()
        addCarButton.frame = CGRect(x: 0, y: 630, width: 250, height: 70)
        addCarButton.center.x = view.center.x
        addCarButton.setTitle("Добавить авто", for: .normal)
        addCarButton.tintColor = UIColor.white
        addCarButton.backgroundColor = UIColor.red
        addCarButton.layer.cornerRadius = 7
        addCarButton.addTarget(self, action: #selector(addCar(sender:)), for: .touchUpInside)
      
        return addCarButton
    }()
    
    
    
private func configureSubviews() {
    view.addSubview(addCarButton)
}
    
    @objc func addCar(sender: UIButton) {
        
        let play = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = play.instantiateViewController(identifier: "viewFour") as? ViewControllerFour else { return }
        self.present(nextScreen, animated: true, completion: nil)
        nextScreen.modalPresentationStyle = .automatic
 
    }
    
    
    @objc func buttonType(_ sender: UIButton) {
        
        let play = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = play.instantiateViewController(identifier: "viewThree") as? ViewControllerTree else { return }
        self.present(nextScreen, animated: true, completion: nil)
        nextScreen.modalPresentationStyle = .automatic
        nextScreen.brendLabel.text = cars[sender.tag].brend
        nextScreen.modelLabel.text = cars[sender.tag].model
        nextScreen.descriptionText.text = cars[sender.tag].description
    }
    
    var cars: [Car] = [Car(brend: "Toyota", model: "Rav4", year: "2014", color: "Blue", photo: "ravBlue.jpg", price: "2100000p", photos: ["rav1.jpg", "rav2.jpg", "rav3.jpg", "rav4.jpg","rav5.jpg","rav6.jpg"],
        description:
        """
         Продаю новый автомобиль,пробег 86 км, съездили два раза до МРЭО на нем,остальное время стоял в гараже. Стоят легкосплавные диски с летней резиной,есть штамповка штатная без зимней резины,установлен регистратор,коврики в салоне и багажнике. Все вопросы по телефону,торг у капота
        """),
                     Car(brend: "Toyota", model: "Rav4", year: "2009", color: "Gold",photo: "ravGold.jpg", price: "1100000p", photos: [""], description: "2"),
                     Car(brend: "Toyota", model: "Alphard", year: "2004", color: "White",photo: "Alphard.jpeg", price: "1300000p", photos: [""], description: "3")]
}

struct Car {
var brend: String
var model: String
var year: String
var color: String
var photo: String
var price: String
var photos: [String]
var description: String

}

    
