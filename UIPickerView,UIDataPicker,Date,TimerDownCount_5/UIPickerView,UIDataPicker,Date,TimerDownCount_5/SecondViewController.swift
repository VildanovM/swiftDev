//
//  SecondViewController.swift
//  UIPickerView,UIDataPicker,Date,TimerDownCount_5
//
//  Created by Максим Вильданов on 09.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOutlet.text = data
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
