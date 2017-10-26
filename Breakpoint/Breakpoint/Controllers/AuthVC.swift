//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/23/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    //@IBActions
    @IBAction func emailLoginBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "\(LOGIN_VC)")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func loginGoogleBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func loginFacebookBtnPressed(_ sender: Any) {
        
    }
    
    //My Functions
    
    
    //System Functions and Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }

}
