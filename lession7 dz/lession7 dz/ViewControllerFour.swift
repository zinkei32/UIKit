//
//  ViewControllerFour.swift
//  lession7 dz
//
//  Created by Сережа on 23.05.2023.
//

import UIKit

class ViewControllerFour: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        createToolbar()
    }
    
    lazy var brendLabel: UILabel = {
       var brendLabel = UILabel()
        brendLabel.frame = CGRect(x: 30, y: 30, width: 150, height: 30)
        brendLabel.font = brendLabel.font.withSize(20)
        brendLabel.textColor = .systemGray
        brendLabel.text = "Марка авто"
        return brendLabel
    }()
    
    lazy var brendTextField: UITextField = {
       var brendTextField = UITextField()
        brendTextField.frame = CGRect(x: 30, y: 70, width: 150, height: 30)
        brendTextField.borderStyle = UITextField.BorderStyle.roundedRect
        brendTextField.tintColor = UIColor.systemGray

        return brendTextField
    }()
    
    lazy var modelLabel: UILabel = {
       var modelLabel = UILabel()
        modelLabel.frame = CGRect(x: 30, y: 110, width: 150, height: 30)
        modelLabel.font = modelLabel.font.withSize(20)
        modelLabel.textColor = .systemGray
        modelLabel.text = "Модель авто:"
        return modelLabel
    }()
    
     lazy var modelTextField: UITextField = {
       var modelTextField = UITextField()
        modelTextField.frame = CGRect(x: 30, y: 150, width: 200, height: 30)
        modelTextField.borderStyle = UITextField.BorderStyle.roundedRect
        modelTextField.tintColor = UIColor.systemGray
        return modelTextField
    }()
    
    lazy var colorLabel: UILabel = {
       var colorLabel = UILabel()
        colorLabel.frame = CGRect(x: 30, y: 190, width: 100, height: 30)
        colorLabel.font = colorLabel.font.withSize(20)
        colorLabel.textColor = .systemGray
        colorLabel.text = "Цвет авто:"
        return colorLabel
    }()
    
     lazy var colorTextField: UITextField = {
       var colorTextField = UITextField()
        colorTextField.frame = CGRect(x: 30, y: 230, width: 200, height: 30)
        colorTextField.borderStyle = UITextField.BorderStyle.roundedRect
        colorTextField.tintColor = UIColor.systemGray
        colorTextField.addTarget(self, action: #selector(colorFunc(sender:)), for: .touchDown)
        return colorTextField
    }()
    
    lazy var yearLabel: UILabel = {
       var yearLabel = UILabel()
        yearLabel.frame = CGRect(x: 30, y: 270, width: 200, height: 30)
        yearLabel.font = yearLabel.font.withSize(20)
        yearLabel.textColor = .systemGray
        yearLabel.text = "Год выпуска авто:"
        return yearLabel
    }()
    
     lazy var yearTextField: UITextField = {
       var yearTextField = UITextField()
        yearTextField.frame = CGRect(x: 30, y: 310, width: 200, height: 30)
        yearTextField.borderStyle = UITextField.BorderStyle.roundedRect
        yearTextField.tintColor = UIColor.systemGray
        yearTextField.addTarget(self, action: #selector(yearAction(sender:)), for: .touchDown)
        
        return yearTextField
    }()
    
    lazy var gbddLabel: UILabel = {
       var gbddLabel = UILabel()
        gbddLabel.frame = CGRect(x: 30, y: 350, width: 240, height: 30)
        gbddLabel.font = yearLabel.font.withSize(20)
        gbddLabel.textColor = .systemGray
        gbddLabel.text = "Стоит на учете в гибдд?"
        return gbddLabel
    }()
    
    lazy var gbddSwith: UISwitch = {
      var gbddSwith = UISwitch()
        gbddSwith.frame = CGRect(x: 275, y: 350, width: 60, height: 30)
        gbddSwith.addTarget(self, action: #selector(switchIsOn(target:)), for: .valueChanged)
       return gbddSwith
   }()
    
    lazy var discriptionLabel: UILabel = {
       var discriptionLabel = UILabel()
        discriptionLabel.frame = CGRect(x: 30, y: 400, width: 150, height: 30)
        discriptionLabel.font = discriptionLabel.font.withSize(20)
        discriptionLabel.textColor = .systemGray
        discriptionLabel.text = "Описание:"
      
        return discriptionLabel
    }()
    
    
    
     lazy var discriptionTextField: UITextField = {
       var discriptionTextField = UITextField()
        discriptionTextField.frame = CGRect(x: 10, y: 430, width: 280, height: 200)
        discriptionTextField.font = UIFont(name: "HelveticaNeue", size: 12)
        discriptionTextField.tintColor = UIColor.systemGray
        discriptionTextField.text =
       """
       """
        
        return discriptionTextField
    }()
    
    private lazy var addCarButton: UIButton = {
        var addCarButton = UIButton()
        addCarButton.frame = CGRect(x: 0, y: 650, width: 250, height: 70)
        addCarButton.center.x = view.center.x
        addCarButton.setTitle("Добавить ", for: .normal)
        addCarButton.tintColor = UIColor.white
        addCarButton.backgroundColor = UIColor.red
        addCarButton.layer.cornerRadius = 7
        addCarButton.addTarget(self, action: #selector(addButton), for: .touchUpInside)
      
        return addCarButton
    }()
    
    private func configureSubviews() {
        view.addSubview(brendLabel)
        view.addSubview(brendTextField)
        view.addSubview(modelLabel)
        view.addSubview(modelTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorTextField)
        view.addSubview(addCarButton)
        view.addSubview(yearLabel)
        view.addSubview(yearTextField)
        view.addSubview(discriptionLabel)
        view.addSubview(discriptionTextField)
        view.addSubview(gbddLabel)
        view.addSubview(gbddSwith)
}
    
    @objc func switchIsOn(target: UISwitch) { // потом придумаю если понадобится
                if target.isOn {
        } else {
      }
    }
    
   
    @objc func addButton(_ sender: UIButton) {
        let contact = UIStoryboard(name: "Main", bundle: nil)
        guard let nextView = contact.instantiateViewController(identifier: "viewTwo") as? ViewControllerTwo else { return }
        
        nextView.cars.append(Car(brend: self.brendTextField.text ?? "", model: self.modelTextField.text ?? "", year: self.yearTextField.text ?? "", color: self.colorTextField.text ?? "", photo: self.brendLabel.text ?? "", price: self.brendLabel.text ?? "", photos: [""], description: self.discriptionTextField.text ?? ""))
       // nextView.modalPresentationStyle = .fullScreen
        self.show(nextView, sender: nil)
        
    }
    
    @objc func yearAction(sender: UITextField) {
        let yearPicker = UIPickerView()
        yearPicker.tag = 1
        sender.inputView = yearPicker
        yearPicker.dataSource = self
        yearPicker.delegate = self
    }
    
    @objc func colorFunc(sender: UITextField) {
        let colorPicker = UIPickerView()
        colorPicker.tag = 0
        sender.inputView = colorPicker
        colorPicker.dataSource = self
        colorPicker.delegate = self
    }
    
    @objc func createToolbar()  {
        let tool = UIToolbar()
        tool.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(closeKey))
        tool.setItems([doneButton], animated: true)
        colorTextField.inputAccessoryView = tool
        yearTextField.inputAccessoryView = tool
    }
    
    @objc func closeKey()  {
        view.endEditing(true)
    }
}

extension ViewControllerFour: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return 10
        } else {
            return 2023
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            let color = ["Blue","White","Black","Yellow","DarkBlue","Red","Pink","Grey","Gold","Silver"]
            let textReturn = color[row]
            colorTextField.text = textReturn
            return textReturn
        } else {
            let stringRow = String(row)
            yearTextField.text = stringRow
            return stringRow
        }
    }
}

extension ViewControllerFour: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  internal  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //photo.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
