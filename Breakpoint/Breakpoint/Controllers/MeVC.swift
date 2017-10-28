//
//  MeVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/24/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    //@IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //@IBActions
    @IBAction func logoutBtnPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: AUTH_VC) as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    
    //System Functions and Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }

}
