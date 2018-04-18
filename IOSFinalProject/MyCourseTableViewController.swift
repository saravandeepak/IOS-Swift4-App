//
//  MyCourseTableViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/16/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase



struct myCourseCellData {
    var code: String
    var name: String
    var term: String
    var instructor: String
}

class MyCourseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref:DatabaseReference!

    @IBOutlet weak var myCourseTableView: UITableView!
    
    var tableViewData = [myCourseCellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myCourseTableView.delegate = self
        self.myCourseTableView.dataSource = self
        
        ref = Database.database().reference()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let user = Auth.auth().currentUser!
        self.ref.child("users").child(user.uid).child("courses").observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                if let keys = value.allKeys as? [String] {
                    self.tableViewData.removeAll()
                    for key in keys {
                        if let c = value[key] as? [String: Any] {
                            let name = c["name"] as! String
                            let term = c["term"] as! String
                            let instructor = c["instructor"] as! String
                            let code = c["code"] as! String
                            self.tableViewData.append(myCourseCellData.init(code: code, name: name, term: term, instructor: instructor))
                        }
                    }
                    self.tableViewData.sort(by: {(a, b) in
                        let c = a.term.split(separator: " ")
                        let d = b.term.split(separator: " ")
                        print(c[1])
                        if c[1] < d[1] {
                           return true
                        } else {
                            return false
                        }
                    })
                    self.myCourseTableView.reloadData()
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! MyCourseTableViewCell
        cell.codeLabel.text = tableViewData[indexPath.section].code
        cell.nameLabel.text = tableViewData[indexPath.section].name
        cell.instructorLabel.text = tableViewData[indexPath.section].instructor
        cell.termLabel.text = tableViewData[indexPath.section].term
        
        return cell
    }
    

}
