//
//  Discussion.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/17/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import Foundation

class Discussion {
    var id: String = ""
    var topic: String = ""
    var owner: String = ""
    var timestamp: Date = Date()
    var courseid: String = ""
}

class Reply {
    var discussionId:String = ""
    var message: String = ""
    var postedBy: String = ""
    var timestamp: Date = Date()
}
