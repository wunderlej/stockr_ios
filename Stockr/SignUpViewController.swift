//
//  SignUpViewController.swift
//  Stockr
//
//  Created by jwunderl on 12/3/19.
//  Copyright © 2019 John Wunderle. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!

    @IBAction func createAccountPressed(_ sender: UIButton) {
        
        
        if let email = emailTextField.text, let password = passwordTextField.text, let name = userNameTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if error != nil {
                    
                    print(error ?? "default error")
                    self.errorMessageLabel.text = error?.localizedDescription
                }
                else {
                    print(authResult!)
                    
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    
                    changeRequest?.displayName = name
                    changeRequest?.commitChanges { (error) in
                        if error != nil {
                            print(error!)
                        } else {
                            self.performSegue(withIdentifier: "AccountCreatedSegue", sender: self)
                        }
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.text = ""

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
