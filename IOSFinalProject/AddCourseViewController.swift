//
//  AddCourseViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/15/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase

class AddCourseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
   
    var ref:DatabaseReference!

    @IBOutlet weak var coursePicker: UIPickerView!
    @IBOutlet weak var termPicker: UIPickerView!
    
    var courseList: [Course] = []
    var termList: [String] = ["Fall 15", "Spring 16", "Summer 16", "Fall 16", "Spring 17", "Summer 17", "Fall 17", "Spring 18"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coursePicker.delegate = self
        self.coursePicker.dataSource = self
        self.termPicker.dataSource = self
        self.termPicker.delegate = self

        ref = Database.database().reference()
        ref.child("courses").observe(.value, with: { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                if let keys = value.allKeys as? [String] {
                    for key in keys {
                        if let c = value[key] as? [String: Any] {
                            let instructorName = c["instructor"] as! String
                            
                            let course = Course()
                            course.code = c["code"] as! String
                            course.name = c["name"] as! String
                            course.description = c["description"] as! String
                            course.credits = c["credits"] as! Double
                            course.type = c["type"] as! String
                            course.level = c["level"] as! String
                            course.rating = c["rating"] as! Double
                            course.noOfRatings = c["noOfRatings"] as! Int
                            self.ref.child("instructors").child(instructorName).observe(.value, with: {(snap) in
                                if let value = snap.value as? NSDictionary {
                                    let instructor = Instructor()
                                    instructor.name = value["name"] as! String
                                    instructor.about = value["about"] as! String
                                    instructor.title = value["title"] as! String
                                    instructor.imageString = value["imageString"] as! String
                                    course.instructor = instructor
                                }
                            })
                            self.courseList.append(course)
                        }
                    }
                    self.coursePicker.reloadAllComponents()
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return courseList.count
        } else {
            return termList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }
        if pickerView.tag == 1 {
            label.text = courseList[row].name
        } else {
            label.text = termList[row]
        }
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        return label
    }

    @IBAction func addCourseAction(_ sender: Any) {
        
        let user = Auth.auth().currentUser!
        
        let course = courseList[coursePicker.selectedRow(inComponent: 0)]
        let term = termList[termPicker.selectedRow(inComponent: 0)]
        self.ref.child("users").child(user.uid).child("courses").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild(course.code){
                self.showAlert(title: "Warning", message: "\(course.code) \(course.name) has been already added")
            }else{
                self.ref.child("users").child(user.uid).child("courses").child(course.code).setValue(["code": course.code, "name": course.name, "instructor": course.instructor.name, "term": term])
                
                self.showAlert(title: "Successfully added course", message: "\(course.code) \(course.name) has been added to you my course")
            }
        })
        
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController()
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.title = title
        alert.message = message
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
