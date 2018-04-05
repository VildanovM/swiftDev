//
//  SecViewController.swift
//  UISwitch_4
//
//  Created by Максим Вильданов on 06.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelCaption: UILabel!
    @IBOutlet weak var labelDelta: UILabel!
    var data: String?
    var delta: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = self.data, let del = self.delta {
            labelCaption.text = data
            labelDelta.text = del
        } else {
            labelCaption.text = "Warning! Your NDS Value is not selected!"
            labelDelta.text = "Warning! Your NDS Value is not selected!"
        }
        // Do any additional setup after loading the view.
    }

    

}
