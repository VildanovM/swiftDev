//
//  GyroViewController.swift
//  Sensors
//
//  Created by Максим Вильданов on 11.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit
import CoreMotion

class GyroViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.2
            manager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (data: CMDeviceMotion?, error: Error?) in
                let x = data!.gravity.x
                let y = data!.gravity.y
                let z = data!.gravity.z
            })
        }
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
