//
//  SecondViewController.swift
//  loginProfile
//
//  Created by Максим Вильданов on 26.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let gender = ["не задан", "муж", "жен"]
    var log : String?
    var pas: String?
    var gend = "не задан"
// outlets
    @IBOutlet weak var loginLike: UILabel!
    @IBOutlet weak var nameOut: UITextField!
    @IBOutlet weak var nikenameOut: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var sliderOut: UISlider!
    
    
    @IBAction func actSlider(_ sender: UISlider) {
        self.view.backgroundColor = UIColor(red: CGFloat(sliderOut.value), green: CGFloat(sliderOut.value) / 255, blue: CGFloat(sliderOut.value), alpha: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        if let login = log {
            loginLike.text = "Вы вошли как: " + (login.count > 0 ? login : "Incognito")
        }
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var name : String?
        var nick : String?
        var gend: String?
        var login: String?
        if segue.identifier == "push" {
            if let nameOp = nameOut.text, let nickOp = nikenameOut.text {
                login = log
                gend = self.gend
                name = nameOp
                nick = nickOp
            }
        }
        (segue.destination as! ThirdViewController).nick =  nick
        (segue.destination as! ThirdViewController).name = name
        (segue.destination as! ThirdViewController).login = login
        (segue.destination as! ThirdViewController).gend = gend
//        var nick: String?
//        var name: String?
//        var login: String?
//        var gend: String?
    }
}

extension SecondViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
}

extension SecondViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let res = gender[row]
        gend = res
        return res
    }
}
