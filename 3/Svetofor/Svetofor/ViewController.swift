//
//  ViewController.swift
//  Svetofor
//
//  Created by Максим Вильданов on 27.02.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var newLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func newButton(_ sender: Any) {
        allert(title: "Mem", message: "Kek", style: .alert)
    }
    

    func allert(title: String, message: String, style: UIAlertControllerStyle) {
        let allertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            if let text = allertController.textFields?.first?.text {
                self.newLabel.text! = text
            }
        }
        allertController.addTextField { (text) in
            
        }
        allertController.addAction(action)
        self.present(allertController, animated: true, completion: nil)
    }
    
}



