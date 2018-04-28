//
//  RegisterViewController.swift
//  ConPro
//
//  Created by Мария Коровина on 24.04.2018.
//  Copyright © 2018 ConPro. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    let url = "https://api.beheltcarrot.ru/account/Register"

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func register(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Alamofire.request(url, method: .post, parameters:["Email":email,"Password":password])
            .responseData {
                response in
                self.statusLabel.text = response.error?.localizedDescription
                print(response)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = ""
        emailTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        firstNameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        repeatedPasswordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    @objc func editingChanged(_ textField: UITextField) {
        
        statusLabel.text = ""

        if passwordTextField.text != repeatedPasswordTextField.text && !(repeatedPasswordTextField.text?.isEmpty)! {
            statusLabel.text = "Passwords are not the same"
        }
        
        textField.text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (textField.text?.isEmpty)!
        {
            textField.layer.cornerRadius = 8.0;
            textField.layer.masksToBounds = true;
            textField.layer.borderColor = UIColor.red.cgColor;
            textField.layer.borderWidth = 2.0;
        }
        else
        {
            textField.layer.borderColor = UIColor.clear.cgColor;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
