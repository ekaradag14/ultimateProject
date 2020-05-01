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

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
