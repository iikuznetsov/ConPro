import UIKit
import Moya

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func register(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text,
            let rpassword = repeatedPasswordTextField.text,
            !email.isEmpty, !password.isEmpty, !rpassword.isEmpty else {
                statusLabel.text = "Please fill in all fields"
                return
        }
        
        if password != rpassword {
            return
        }
        
        if !email.isEmail() {
            statusLabel.text = "Email is incorrect"
            return
        }
        
        provider.request(.register(email: email, password: password)) {
            result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let response = try moyaResponse.map(Response.self)
                    UserDefaults.standard.set(response.data?.toJSON(), forKey:"token")
                    
                    self.performSegue(withIdentifier: "segueToEvents", sender: self)

                }
                catch {
                    let error = error as? MoyaError
                    
                    if let code = error?.response?.statusCode {
                        self.statusLabel.text = String(code)
                    }
                }
                
            case let .failure(error):
                self.statusLabel.text = error.errorDescription
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = ""
        emailTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
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
