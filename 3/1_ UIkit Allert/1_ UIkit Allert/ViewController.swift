//
//  ViewController.swift
//  1_ UIkit Allert
//
//  Created by Максим Вильданов on 28.02.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let startParol = "123"
    var login = "Max"
    var pas = "123"

    @IBOutlet weak var loginOutlet: UITextField!
    @IBOutlet weak var passWordOutlet: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        passWordOutlet.isSecureTextEntry = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func okAction(_ sender: Any) {
        allertOk()
    }
    
    @IBAction func forgetPasswordAction(_ sender: Any) {
        
        allertForgetPas()
    }
   
    
    func allertOk() {
        let allert = UIAlertController(title: "Вход в приложение", message: "", preferredStyle: .alert)
        let allertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        if passWordOutlet.text! == pas && loginOutlet.text! == login{
            allert.message = "Ура! вы вошли в мое первое приложение!"
        } else {
            allert.message = "К сожалению, доступ запрещен. Попробуйте еще!"
        }
        allert.addAction(allertAction)
        self.present(allert, animated: true, completion: nil)
    }
    
    func allertForgetPas() {
        let allert2 = UIAlertController(title: "Вход в приложение", message: "Введите пароль:", preferredStyle: .alert)
        allert2.addTextField(configurationHandler: nil)
        
        let allertAction2 = UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            if (allert2.textFields?.first?.text!) == "" {
                self.pas = self.startParol
            } else {
                self.pas = (allert2.textFields?.first?.text!)!
            }
        })
        allert2.addAction(allertAction2)
        self.present(allert2, animated: true, completion: nil)
        
}

}
