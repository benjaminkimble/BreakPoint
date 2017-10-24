//
//  MeVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/24/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    //@IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //@IBActions
    @IBAction func logoutBtnPressed(_ sender: Any) {
    
    }
    
    //System Functions and Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
