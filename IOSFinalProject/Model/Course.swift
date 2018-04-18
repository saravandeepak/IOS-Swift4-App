//
//  Course.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/13/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import Foundation

class Course {
    var code:String = ""
    var name:String = ""
    var description:String = ""
    var instructor: Instructor = Instructor()
    var credits: Double = 0.0
    var type: String = ""
    var level: String = ""
    var rating: Double = 0.0
    var noOfRatings: Int = 0
}
