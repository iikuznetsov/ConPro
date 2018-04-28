import UIKit
import Alamofire
import Moya

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        provider = MoyaProvider<APIService>()
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
        
        provider.request(.login(email: email, password: password)) {
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
