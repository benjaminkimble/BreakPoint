//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/26/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //@IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    //My Functions
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
    //System Functions and Overrides
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
