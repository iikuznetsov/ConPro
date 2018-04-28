import UIKit
import Alamofire
import Moya

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func register(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        provider.request(.register(email: email, password: password)) {
            result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                print(moyaResponse.request.debugDescription)
                print(moyaResponse)
            case let .failure(error):
                self.statusLabel.text = error.errorDescription
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        provider = MoyaProvider<APIService>()
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
