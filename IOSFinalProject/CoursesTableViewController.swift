//
//  CoursesTableViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/12/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase

struct cellData {
    var opened = Bool()
    var course = Course()
    
}

class CoursesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var coursesTableView: UITableView!
    
    var tableViewData = [cellData]()
    var ref:DatabaseReference!
    private var myIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coursesTableView.dataSource = self
        coursesTableView.delegate = self
        coursesTableView.backgroundColor = UIColor.clear
        coursesTableView.backgroundView = UIImageView(image: UIImage(named: "homebg"))

        
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
                                self.coursesTableView.reloadData()
                            })
                            self.tableViewData.append(cellData.init(opened: false, course: course))
                        }
                    }
                    self.coursesTableView.reloadData()
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return 150
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened {
            return 2
        } else {
            return 1
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTitleTableViewCell
            cell.courseCode.text = tableViewData[indexPath.section].course.code
            cell.courseName.text = tableViewData[indexPath.section].course.name
            cell.advisorName.text = tableViewData[indexPath.section].course.instructor.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! CourseDetailTableViewCell
            cell.creditsLabel?.text = String(tableViewData[indexPath.section].course.credits)
            cell.typeLabel?.text = tableViewData[indexPath.section].course.type
            cell.levelLabel?.text = tableViewData[indexPath.section].course.level
            cell.detailLabel?.text = tableViewData[indexPath.section].course.description
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        } else {
            myIndex = indexPath.section
            performSegue(withIdentifier: "detailSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CourseDetailViewController {
            dest.course = tableViewData[myIndex].course
        }
    }

}
