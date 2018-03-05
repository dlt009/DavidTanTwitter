//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by David Tan on 3/4/18.
//  Copyright © 2018 David Tan. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String

    }
}
