//
//  Constants.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/24/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import Foundation

typealias CompletionHandlerBool = (_ status: Bool, _ error: Error?) -> ()
typealias CompletionHandlerStringArray = (_ returnedArray: [String]) -> ()

let AUTH_VC = "AuthVC"
let LOGIN_VC = "LoginVC"
let GROUP_FEED_VC = "GroupFeedVC"

let FEED_CELL = "MessageFeedCell"
let GROUP_CELL = "GroupCell"
let USER_CELL = "UserCell"
let GROUP_FEED_CELL = "GroupFeedCell"
