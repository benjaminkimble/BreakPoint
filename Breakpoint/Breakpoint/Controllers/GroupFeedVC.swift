//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/28/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    @IBOutlet weak var groupTable: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var sendBtnView: UIView!
    
    var group: Group?
    var groupMessages = [Message]()
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if messageTextField.text != "" {
            sendBtn.isEnabled = false
            messageTextField.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key, sendComplete: { (complete, error) in
                if complete {
                    self.sendBtn.isEnabled = true
                    self.messageTextField.isEnabled = true
                    self.messageTextField.text = ""
                } else {
                    
                }
            })
        }
    }
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sendBtnView.bindToKeyboard()
        groupTable.delegate = self
        groupTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.title
        guard let group = self.group else { membersLbl.text = ""; return }
        DataService.instance.getEmails(forGroup: group) { returnedEmails in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        DataService.instance.REF_GROUPS.observe(.value) { snapshot in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { returnedGroupMessages in
                self.groupMessages = returnedGroupMessages
                self.groupTable.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.groupTable.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
    }

}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupTable.dequeueReusableCell(withIdentifier: GROUP_FEED_CELL, for: indexPath) as? GroupFeedCell else { return UITableViewCell()}
        let message = groupMessages[indexPath.row]
        DataService.instance.getUserId(forUID: message.senderId) { email in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
