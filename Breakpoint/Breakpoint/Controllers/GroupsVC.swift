//
//  GroupsVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/22/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    //@IBOutlets
    @IBOutlet weak var groupsTableView: UITableView!
    
    //Variables
    var groupsArray = [Group]()
    
    //System Functions and Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsTableView.delegate = self
        groupsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.REF_GROUPS.observe(.value) { snapshot in
            DataService.instance.getAllGroups { returnedGroups in
                self.groupsArray = returnedGroups
                self.groupsTableView.reloadData()
            }
        }
        
        
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: GROUP_CELL) as? GroupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.title, description: group.desc, memberCount: group.memberCount)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: GROUP_FEED_VC) as? GroupFeedVC else { return }
        groupFeedVC.initData(forGroup: groupsArray[indexPath.row])
        present(groupFeedVC, animated: true, completion: nil)
    }
}

