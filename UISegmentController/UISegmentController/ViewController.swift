//
//  ViewController.swift
//  UISegmentController
//
//  Created by Максим Вильданов on 07.04.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var index = 0
    var segmentCont = UISegmentedControl()
    var imageView = UIImageView()
    let items = ["Iphone 7", "Iphone SE", "Iphone X", "Iphone 8+"]
    let imagesArray = [UIImage(named: "iphone 7.jpeg"), UIImage(named: "iphone SE.jpeg"), UIImage(named: "iphone X.jpeg"), UIImage(named: "iphone8+.jpg")]
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentCont = UISegmentedControl(items: items)
        segmentCont.frame = CGRect(x: 50, y:500, width: 300, height: 50)
        segmentCont.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        view.addSubview(segmentCont)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 250)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        
        let navBar = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        navBar.contentMode = .scaleAspectFit
        navBar.image = UIImage(named: "apple")
        navigationItem.titleView = navBar
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func segmentChanged() {
        let segmentIndex = segmentCont.selectedSegmentIndex
        imageView.image = imagesArray[segmentIndex]
        index = segmentIndex
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var namePhone : String?
        var imagePhone : UIImage?
        if segue.identifier == "push" {
            if let namePhoneOp = segmentCont.titleForSegment(at: index), let imagePhoneOp = imageView.image {
                namePhone = namePhoneOp
                imagePhone = imagePhoneOp
            }
        }
        (segue.destination as! SecondViewController).name =  namePhone
        (segue.destination as! SecondViewController).img = imagePhone
    }

}

