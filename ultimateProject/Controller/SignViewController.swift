//
//  SignViewController.swift
//  ultimateProject
//
//  Created by Erencan Karadağ on 1.05.2020.
//  Copyright © 2020 Erencan Karadağ. All rights reserved.
//

import UIKit
import Firebase
class SignViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func signButtonPressed(_ sender: UIButton) {
        let email = mailText.text!
        let password = passwordText.text!
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
            } else {
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
            }
            
        }
    }
   
}
