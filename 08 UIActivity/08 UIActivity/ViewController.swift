//
//  ViewController.swift
//  08 UIActivity
//
//  Created by Максим Вильданов on 15.04.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Enter text to share"
        textField.delegate = self
        view.addSubview(textField)
    }
    
    func createButton(){
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 50, y: 550, width: 280, height: 44)
        buttonShare.setTitle("Share", for: .normal)
        buttonShare.addTarget(self, action: #selector(handlerShare), for: .touchUpInside)
        view.addSubview(buttonShare)
    }
    @objc func handlerShare() {
        let text = textField.text
        
        if text?.characters.count == 0 {
            let message = "Enter text to share!"
            let alertC = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertC.addAction(action)
            present(alertC,animated: true, completion: nil)
        }
        
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        
        activityViewController.excludedActivityTypes = [UIActivityType.addToReadingList, UIActivityType.postToFacebook]
        present(activityViewController!, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

