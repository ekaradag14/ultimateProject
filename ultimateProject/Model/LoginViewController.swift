//
//  LoginViewController.swift
//  ultimateProject
//
//  Created by Erencan Karadağ on 1.05.2020.
//  Copyright © 2020 Erencan Karadağ. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let email = usernameTextField.text!
        let password = passwordTextField.text!
        
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                     if let e = error {
                         print(e.localizedDescription)
                     } else if error == nil {
        
                         self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                     }
                         guard let self = self else { return } // bu aslında gerekli değil çalışması için
                    
                                    
                                 
                         // ...
                       }
                 
             }
           
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


