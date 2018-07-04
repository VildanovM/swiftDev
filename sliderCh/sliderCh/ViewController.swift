//
//  ViewController.swift
//  sliderCh
//
//  Created by Максим Вильданов on 02.04.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cur = 0
    @IBOutlet weak var sliderOut: UISlider!
    var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = CGRect(x: 0, y: 0, width: 30, height: 50)
        label.text = "semka"
        label.center = view.center
        view.addSubview(label)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderAct(_ sender: Any) {
        cur += 1
        self.view.backgroundColor = UIColor(red: CGFloat(sliderOut.value), green: CGFloat(sliderOut.value), blue: CGFloat(sliderOut.value) / 255, alpha: 1)
        label.text = "\(cur): semka"
        
    }
    
   
        
    }



