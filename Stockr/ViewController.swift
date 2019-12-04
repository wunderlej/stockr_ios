//
//  ViewController.swift
//  Stockr
//
//  Created by jwunderl on 12/3/19.
//  Copyright © 2019 John Wunderle. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    print(authResult!)
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
            }
        }
    }
    
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "SignUpSegue", sender: self)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

