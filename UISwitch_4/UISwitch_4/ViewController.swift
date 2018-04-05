//
//  ViewController.swift
//  UISwitch_4
//
//  Created by Максим Вильданов on 06.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchTwo: UISwitch!
    @IBOutlet weak var switchOne: UISwitch!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    @IBAction func switchOne(_ sender: UISwitch) {
        
        switchOne.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
    }
    
    @IBAction func switchTwo(_ sender: Any) {
        
        switchOne.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
    }
    
    @objc func isOn (target: UISwitch) {
        if self.switchOne.isOn {
            self.switchTwo.isOn = false
        } else if !self.switchOne.isOn {
            self.switchTwo.isOn = true
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                var labeltext : String?
                var deltaString : String?
                if segue.identifier == "push" {
                    if let text = textField.text {
                        if switchOne.isOn && text.count > 0 {
                            labeltext = String(Double(text)! * 1.18)
                            deltaString = String((Double(labeltext!))! - (Double(text))!)
                        
                       } else if switchTwo.isOn && text.count > 0 {
                            labeltext = String(Double(text)! * 1.10)
                            deltaString = String((Double(labeltext!))! - (Double(text))!)
                        }
                    }
                }
                (segue.destination as! SecondViewController).data =  labeltext
                (segue.destination as! SecondViewController).delta =  deltaString
        
            }
    
}

