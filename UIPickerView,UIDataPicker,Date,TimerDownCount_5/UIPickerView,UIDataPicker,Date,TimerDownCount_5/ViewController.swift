//
//  ViewController.swift
//  UIPickerView,UIDataPicker,Date,TimerDownCount_5
//
//  Created by Максим Вильданов on 09.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var dateOutlet2: UIDatePicker!
    @IBOutlet weak var dateOutlet1: UIDatePicker!
    var year: Int?
    var time: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        dateOutlet1.addTarget(self, action: #selector(labelOneChange(picker:)), for: .valueChanged)
        dateOutlet2.addTarget(self, action: #selector(labelTwoChange(picker:)), for: .valueChanged)
    }

    @IBAction func checkTimeButton(_ sender: UIButton) {
        allertVC()
    }
    @objc func labelOneChange(picker: UIDatePicker) {
        let textlabel = String(describing: picker.date)
        var temp1 = ""
        var temp2 = ""
        for (i,v) in textlabel.enumerated() {
            if i == 11 {
                break
            }
            temp1.append(v)
        }
        for (i,v) in textlabel.enumerated() {
            if i == 4 {
                break
            }
            temp2.append(v)
        }
        label1.text = temp1
        self.year = Int(temp2)
    }
    
    @objc func labelTwoChange(picker: UIDatePicker){
        let textlabel = String(describing: picker.date)
        var temp = ""
        for (i,v) in textlabel.enumerated() {
            if i < 11 {
                continue
            }
            temp.append(v)
            if i > 14 {
                break
            }
        }
        var stringArr = Array(temp)
        let twoInt = String(Int(String(stringArr[0]))! * 10 + Int(String(stringArr[1]))! + 3)
        let time = twoInt + ":" + String(stringArr[3]) + String(stringArr[4])
        
//        if let value = Int(twoInt), value < 10 {
//            stringArr[0] = "0"
//            stringArr[1] = Character(twoInt)
//            label2.text = String(stringArr)
//        } else
        if let value = Int(twoInt), value > 24 {
            stringArr[0] = "0"
            let temp = String(value - 24)
            stringArr[1] = Character(temp)
//            label2.text = String(stringArr)
            self.time = String(stringArr)
        } else if let value = Int(twoInt), value == 24 || value == 0 {
            stringArr[0] = "0"
            stringArr[1] = "0"
//            label2.text = String(stringArr)
            self.time = String(stringArr)
        } else {
//            label2.text = time
            self.time = time.count < 5 ? "0" + time : time
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var labeltext = ""
        if segue.identifier == "push" {
            if let year = year {
                if year % 4 == 0 && year % 100 != 0 || year % 400 == 0 {
                    labeltext = "Leap year"
                } else {
                    labeltext = "Non-leap year"
                }
            }
        }
        (segue.destination as! SecondViewController).data =  labeltext
    }
    
    func allertVC() {
        let allert = UIAlertController(title: "Time checker", message: "Time is: \n 00:00 ", preferredStyle: .alert)
        let allertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        allert.addAction(allertAction)
        if let time = time {
            allert.message = "Time is: \n \(time)"
        }
        self.present(allert, animated: true, completion: nil)
    }

    
}

