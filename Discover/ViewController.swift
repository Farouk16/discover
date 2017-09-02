//
//  ViewController.swift
//  Discover
//
//  Created by Farouk on 8/24/17.
//  Copyright © 2017 Farouk. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import KeychainSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    func CompleteSignIn(id: String){
        let keyChain = DataService().keyChain
        keyChain.set(id , forKey: "uid")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        let keyChain = DataService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "SignIn", sender: nil)
        }
        
        
}
    @IBAction func SignIn(_ sender: Any){
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.CompleteSignIn(id: user!.uid)
                    self.performSegue(withIdentifier: "SignIn", sender: nil)
                } else {
               Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("cant sign in user")
                        } else {
                            self.CompleteSignIn(id: user!.uid)
                            self.performSegue(withIdentifier: "SignIn", sender: nil)
                        }
                    }
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                textField.resignFirstResponder()
        return true
    }
    
}


