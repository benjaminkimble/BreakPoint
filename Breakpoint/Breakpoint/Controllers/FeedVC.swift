//
//  FeedVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/22/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    //@IBOutlets
    @IBOutlet weak var feedTable: UITableView!
    
    //Variables
    var messageArray = [Message]()
    
    //System Functions and Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessages) in
            self.messageArray = returnedMessages.reversed()
            self.feedTable.reloadData()
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = feedTable.dequeueReusableCell(withIdentifier: FEED_CELL) as? FeedCell else { return UITableViewCell()}
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUserId(forUID: message.senderId) { (returnedUserName) in
            cell.configureCell(profileImage: image!, email: returnedUserName, content: message.content)
        }
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

