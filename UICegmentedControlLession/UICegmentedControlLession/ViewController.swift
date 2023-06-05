//
//  ViewController.swift
//  UICegmentedControlLession
//
//  Created by Сережа on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
var menuArray = ["one","two","three"]
    var imageArray = [UIImage(named: "корн.jpeg"), UIImage(named: "bad thing.jpeg"),UIImage(named: "stone sour.jpeg")]
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentControl = UISegmentedControl(items: self.menuArray )
        self.segmentControl.frame = CGRect(x: 100, y: 400, width: 200, height: 30)
       self.view.addSubview(self.segmentControl)
        
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        self.segmentControl.addTarget(self, action: #selector(selectValue), for: .valueChanged)
    }

    @objc func selectValue(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            self.imageView.image = self.imageArray[segmentIndex]
            let index = target.titleForSegment(at: segmentIndex)
            print(index ?? "")
    }
    }
}

