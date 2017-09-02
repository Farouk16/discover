//
//  SignOut.swift
//  Discover
//
//  Created by Farouk on 8/30/17.
//  Copyright © 2017 Farouk. All rights reserved.
//

import UIKit
import Firebase
import KeychainSwift

class SignOut: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func SignOut (_ sender: Any){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        DataService().keyChain.delete("uid")
        dismiss(animated: true, completion: nil)
    }
    
}

