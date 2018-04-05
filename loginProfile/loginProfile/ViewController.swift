//
//  ViewController.swift
//  loginProfile
//
//  Created by Максим Вильданов on 26.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlets
    @IBOutlet weak var loginOut: UITextField!
    @IBOutlet weak var passwordOut: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var loginOpt : String?
        var passwordOpt : String?
        if segue.identifier == "push" {
            if let login = loginOut.text, let password = passwordOut.text {
                loginOpt = login
                passwordOpt = password
            }
        }
        (segue.destination as! SecondViewController).log =  loginOpt
        (segue.destination as! SecondViewController).pas = passwordOpt
        
    }

}

