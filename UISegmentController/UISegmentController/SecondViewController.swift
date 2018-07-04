//
//  SecondViewController.swift
//  UISegmentController
//
//  Created by Максим Вильданов on 07.04.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name : String?
    var img : UIImage?
    var activityView: UIActivityViewController!
    let iphone7 = ["Display: Retina HD 4,7\"", "Identifier: Touch ID", "Processor: A10 Fusion", "Camera: Single 12 mp"]
    let iphoneSE = ["Display: Retina HD 4,0\"", "Identifier: Touch ID", "Processor: A9", "Camera: Single 12 mp"]
    let iphoneX = ["Display: Retina HD 5,8\"", "Identifier: Face ID", "Processor: A11 Bionic Fusion", "Camera: Double 12 mp"]
    let iphone8Plus = ["Display: Retina HD 5,5\"", "Identifier: Touch ID", "Processor: A11 Bionic Fusion", "Camera: Double 12 mp"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var namePhone: UILabel!
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var identifier: UILabel!
    
    @IBOutlet weak var camera: UILabel!
    
    @IBOutlet weak var processor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeValuesInLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func share(_ sender: Any) {
        let message = "Pleace choise your phone!"
        if display.text?.characters.count == 0 {
            let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
        activityView = UIActivityViewController(activityItems: [img, display.text, identifier.text, camera.text, processor.text], applicationActivities: nil)
        activityView.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.mail]
        present(activityView, animated: true)
    }
    
    fileprivate func changeValuesInLoad() {
        
        let navBar = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        navBar.contentMode = .scaleAspectFit
        navBar.image = UIImage(named: "apple")
        
        navigationItem.titleView = navBar
        identifier.adjustsFontSizeToFitWidth = true
        namePhone.text = name
        switch name {
        case "Iphone 7":
            display.text = iphone7[0]
            identifier.text = iphone7[1]
            camera.text = iphone7[3]
            processor.text = iphone7[2]
        case "Iphone SE":
            display.text = iphoneSE[0]
            identifier.text = iphoneSE[1]
            camera.text = iphoneSE[3]
            processor.text = iphoneSE[2]
        case "Iphone X":
            display.text = iphoneX[0]
            identifier.text = iphoneX[1]
            camera.text = iphoneX[3]
            processor.text = iphoneX[2]
        case "Iphone 8+":
            display.text = iphone8Plus[0]
            identifier.text = iphone8Plus[1]
            camera.text = iphone8Plus[3]
            processor.text = iphone8Plus[2]
        default: break
        }
        imageView.contentMode = .scaleAspectFit
        imageView.image = img
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
