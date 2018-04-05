//
//  ViewController.swift
//  sliderCh
//
//  Created by Максим Вильданов on 02.04.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderOut: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderAct(_ sender: Any) {
        sliderValueDidChange(sender: sliderOut)
        self.view.backgroundColor = UIColor(red: CGFloat(sliderOut.value), green: CGFloat(sliderOut.value) / 255, blue: CGFloat(sliderOut.value), alpha: 1)
    }
    
    func sliderValueDidChange(sender: UISlider) {
        switch sender.value {
        case let a where a <= 0.3 : sliderOut.minimumTrackTintColor = UIColor.green
        case let a where a > 0.3 && a <= 0.6 : sliderOut.minimumTrackTintColor = UIColor.yellow
        default:
            sliderOut.minimumTrackTintColor = UIColor.red
        }
        
    }


}

