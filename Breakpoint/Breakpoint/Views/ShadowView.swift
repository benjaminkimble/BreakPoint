//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/23/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    func setupView() {
        
    }
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        super.awakeFromNib()
    }

}
