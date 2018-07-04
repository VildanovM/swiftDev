//
//  SecondViewController.swift
//  Test_1
//
//  Created by Максим Вильданов on 11.06.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name : String?
    var stars: Int?
    var forks: Int?
    var views: Int?
    var url  = "https://github.com/"
    
    @IBOutlet weak var viewsOuth: UILabel!
    @IBOutlet weak var forksOuth: UILabel!
    
    @IBOutlet weak var starsOuth: UILabel!
    @IBOutlet weak var gitHubButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        gitHubButtonOutlet.layer.cornerRadius = 10
//        print(name)
//        print(stars)
//        print(forks)
//        print(views)
        viewsOuth.text = String(views!).makeIntToStr
        starsOuth.text = String(stars!).makeIntToStr
        forksOuth.text = String(forks!).makeIntToStr
        title = name
       
    }
    
    @IBAction func urlAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: url)! as URL, options: [:], completionHandler: nil)
    }
    
}

extension String {
    var makeIntToStr: String {
        if let number = Int(self), number > 999 && number < 1_000_000 {
            let intIndex = self.index(self.endIndex, offsetBy: -3)
            let endIndex = self.index(self.endIndex, offsetBy: -2)
            return ((self[..<intIndex]) + "," + self[intIndex..<endIndex] + "K")
        } else if let number = Int(self), number > 999_999 {
            let intIndex = self.index(self.endIndex, offsetBy: -6)
            let endIndex = self.index(self.endIndex, offsetBy: -5)
            return ((self[..<intIndex]) + "," + self[intIndex..<endIndex] + "M")
        } else {
            return self
        }
    
    }
}
