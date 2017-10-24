//
//  AuthService.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/22/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    //My Functions
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping CompletionHandlerBool) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            let userData: Dictionary<String, Any> = ["provider": user.providerID,
                            "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping CompletionHandlerBool) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard user != nil else {
                loginComplete(false, error)
                return
            }
            
            loginComplete(true, nil)
        }
    }
}
