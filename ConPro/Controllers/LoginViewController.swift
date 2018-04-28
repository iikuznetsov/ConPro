//
//  LoginViewController.swift
//  ConPro
//
//  Created by Мария Коровина on 24.04.2018.
//  Copyright © 2018 ConPro. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    let url = "https://api.beheltcarrot.ru/account/GetToken"
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = ""
        emailTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func logIn(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text,
            !email.isEmpty, !password.isEmpty else {
                statusLabel.text = "Please fill in both fields"
                return
        }

        Alamofire.request(url, method: .post, parameters:["Email":email,"Password":password])
            .responseData {
            response in
            self.statusLabel.text = response.error?.localizedDescription
            print(response)
            }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        
        statusLabel.text = ""

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
