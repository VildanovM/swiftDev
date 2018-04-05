//
//  ThirdViewController.swift
//  loginProfile
//
//  Created by Максим Вильданов on 02.04.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var nick: String?
    var name: String?
    var login: String?
    var gend: String?
    
    @IBOutlet weak var nickOut: UILabel!
    @IBOutlet weak var nameOut: UILabel!
    @IBOutlet weak var loginOut: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nick = nick {
            nickOut.text = "Nick: " + (nick.count > 0 ? nick : "Incognito")
        }
        if let name = name {
            nameOut.text = "Name: " + (name.count > 0 ? name : "Incognito")
        }
        if let login = login {
            loginOut.text = "Login: " + (login.count > 0 ? login : "Incognito")
        }
        if let gend = gend {
            gender.text = "Gender: " + (gend.count > 0 ? gend : "не определен")
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
