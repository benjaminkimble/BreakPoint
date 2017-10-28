//
//  CreateGroupsVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/28/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    //@IBOutlets
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    
    //@IBActions
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
    }
    
    //System Functions and Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
