//
//  ViewController.swift
//  lession7 dz
//
//  Created by Сережа on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
    
    private lazy var showButton: UIButton = {
        var showButton = UIButton()
        let image = UIImageView()
        showButton.frame = CGRect(x: 180, y: 531, width: 28, height: 28)
        showButton.setImage(UIImage(named: "eyeshow.png"), for: .normal)
        showButton.tintColor = UIColor.systemGray
        showButton.addTarget(self, action: #selector(showPasswordFunc), for: .touchUpInside)
        return showButton
    }()
    
    private lazy var signInButton: UIButton = {
        var signInButton = UIButton(type: .roundedRect)
        signInButton.frame = CGRect(x: 0, y: 630, width: 250, height: 70)
        signInButton.center.x = view.center.x
        signInButton.setTitle("Вход", for: .normal)
        signInButton.tintColor = UIColor.white
        signInButton.backgroundColor = UIColor.red
        signInButton.layer.cornerRadius = 7
        signInButton.addTarget(self, action: #selector(signinButton), for: .touchUpInside)
      
        return signInButton
    }()
    
    private lazy var carSaleImage: UIImageView = {
        var carSaleImage = UIImageView()
        carSaleImage.frame = CGRect(x: 0, y: 80, width: 200, height: 200)
        carSaleImage.center.x = view.center.x
        carSaleImage.image = UIImage(named: "car sale.jpeg")
        return carSaleImage
    }()
    
    private lazy var textSale: UILabel = {
        var textSale = UILabel()
        textSale.frame = CGRect(x: 0, y: 300, width: 250, height: 50)
        textSale.center.x = view.center.x
        textSale.text = "Продажа хлама.ru"
        textSale.font = textSale.font.withSize(26)
        
        return textSale
    }()
    
    
    private lazy var emailLabel: UILabel = {
       var emailLabel = UILabel()
        emailLabel.frame = CGRect(x: 20, y: 400, width: 200, height: 20)
        emailLabel.text = "Your email:"
        emailLabel.textColor = UIColor.systemGray
        
        return emailLabel
    }()

    private lazy var passwordLabel: UILabel = {
       var passwordLabel = UILabel()
        passwordLabel.frame = CGRect(x: 20, y: 500, width: 200, height: 20)
        passwordLabel.text = "Your passowrd:"
        passwordLabel.textColor = UIColor.systemGray
        
        return passwordLabel
    }()
    
    private lazy var emailTextField: UITextField = {
       var emailTextField = UITextField()
        emailTextField.frame = CGRect(x: 20, y: 430, width: 200, height: 30)
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.tintColor = UIColor.systemGray
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
       var passwordTextField = UITextField()
        passwordTextField.frame = CGRect(x: 20, y: 530, width: 200, height: 30)
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.tintColor = UIColor.systemGray
        
        return passwordTextField
    }()
    
    // MARK: добавление во вьюдидлок
    private func configureSubviews() {
        view.addSubview(passwordLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(carSaleImage)
        view.addSubview(textSale)
        view.addSubview(signInButton)
        view.addSubview(showButton)

    }
    
    //MARK: Функции
    @IBAction func signinButton(_ sender: UIButton) {
        let name = emailTextField.text
        let password = passwordTextField.text
        
        if name != "Serg" || password != "0000"  {
            let alert = UIAlertController(title: "Че-то не так", message: "Нормальный логин и пароль введи", preferredStyle: .alert)
            let alertOK = UIAlertAction(title: "Понял", style: .default)
            alert.addAction(alertOK)
            self.present(alert, animated: true, completion: nil)
        } else {
            let story: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newStory = story.instantiateViewController(withIdentifier: "viewTwo") as! ViewControllerTwo
            
            self.present(newStory, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func showPasswordFunc(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
}




