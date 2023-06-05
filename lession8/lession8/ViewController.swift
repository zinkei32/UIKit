//
//  ViewController.swift
//  lession8
//
//  Created by Сережа on 25.05.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityView: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton()
        self.createTextField()
    }


    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        self.view.addSubview(self.textField)
    }
    
    func createButton() {
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        self.buttonShare.setTitle("Расшарить", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(hendleShare), for: .touchUpInside)
        self.view.addSubview(buttonShare)
    }
    
    @objc func hendleShare(paramSender: Any)  {
        let text = self.textField.text
        
        if text?.count == 0 {
            let massage = "Сначало введите техт, потом нажмите кнопку"
            let allertCont = UIAlertController(title: nil, message: massage, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil )
            
            allertCont.addAction(action)
            self.present(allertCont, animated: true, completion: nil)
    }
        self.activityView = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityView!, animated: true, completion: nil)
}
    func textFieldShould(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        
        return true
    }
    
}
