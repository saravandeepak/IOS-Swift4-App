//
//  User.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/13/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import Foundation

class User {
    var uid:String = ""
    var name:String = ""
    var email:String = ""
    var photoUrl:String = ""
    var courses: [Course] = []
    var peers: [User] = []
}
