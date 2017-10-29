//
//  Group.swift
//  Breakpoint
//
//  Created by Benjamin Kimble on 10/28/17.
//  Copyright © 2017 Benjamin Kimble. All rights reserved.
//

import Foundation

class Group {
    private var _title: String
    private var _desc: String
    private var _key: String
    private var _memberCount: Int
    private var _members = [String]()
    
    var title: String {
        return _title
    }
    
    var desc: String {
        return _desc
    }
    
    var key: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }
    
    init(title: String, description: String, key: String, members: [String], memberCount: Int) {
        self._title = title
        self._desc = description
        self._key = key
        self._memberCount = memberCount
        self._members = members
    }
}
