//
//  ViewController.swift
//  Sensors
//
//  Created by Максим Вильданов on 11.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit
import CoreMotion

class AccelViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.isAccelerometerAvailable {
            manager.accelerometerUpdateInterval = 0.2
            manager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data: CMAccelerometerData? , error: Error?) in
                let x = data!.acceleration.x
                let y = data!.acceleration.y
                let z = data!.acceleration.z
                
                print("x= \(x); y=\(y): z= \(z)")
                
                if x < -0.2 {
                    self.mainView.backgroundColor = UIColor.red
                    
                } else if x > 0.2 {
                    self.mainView.backgroundColor = UIColor.green
                }
            })
        }
    }


}

