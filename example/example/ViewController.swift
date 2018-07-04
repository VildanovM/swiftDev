//
//  ViewController.swift
//  example
//
//  Created by Максим Вильданов on 13.04.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var curName = ""
    let massive = ["Maxim", "Adelja", "Mama", "Papa", "Dedushka"]
    @IBOutlet weak var pickerOutlet: UIPickerView!
    @IBOutlet weak var switchOutlet: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        switchOutlet.addTarget(self, action: #selector(changeSwitch), for: .valueChanged)
    }

    @IBAction func A(_ sender: Any) {
        
        let alert = UIAlertController(title: "Ваше имя", message: "Ваше имя - \(curName) ", preferredStyle: .alert)
        let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true)
        
    }
  
 
    @objc func changeSwitch() {
        if !(switchOutlet.isOn) {
            view.backgroundColor = .red
            
        } else {
            view.backgroundColor = .brown
        }
    }

}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return massive.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        curName = massive[row]
        return String(row + 1) + ": " + massive[row]
    }
}
