//
//  RegisterViewController.swift
//  ANQESSAR
//
//  Created by Home on 9/24/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
        if let email = emailTextField.text , let password = passwordTextField.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                }else{
                    
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
        }
       
        }
    }
    
  

}
