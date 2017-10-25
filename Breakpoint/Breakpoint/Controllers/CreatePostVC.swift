//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/25/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if messageTextView.text != nil && messageTextView.text.lowercased() != "say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (success, error) in
                if success {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("there was an error: \(error?.localizedDescription ?? "")")
                }
            })
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
