//
//  DiscussionsTableViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/17/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase

class DiscussionsTableViewController: UITableViewController {

    var course: Course?
    var tableViewData: [Discussion] = []
    var df = DateFormatter()
    var ref: DatabaseReference!
    var myIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        df.dateFormat = "MM-dd-yyyy"
        df.timeStyle = DateFormatter.Style.none
        df.dateStyle = DateFormatter.Style.short
        
        ref = Database.database().reference()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DiscussionTableViewCell

        cell.topicLabel.text = tableViewData[indexPath.section].topic
        cell.postedBy.text = tableViewData[indexPath.section].owner
        cell.postedDate.text = df.string(from: tableViewData[indexPath.section].timestamp)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.section
        performSegue(withIdentifier: "showReply", sender: self)
    }
    
    @IBAction func addDiscussionBtn(_ sender: Any) {
        performSegue(withIdentifier: "addDiscussion", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DiscussionCollectionViewController {
            dest.discussion = tableViewData[myIndex]
        }
        if let dest = segue.destination as? AddDiscussionPopUpViewController {
            dest.course = course
            dest.delegate = self
        }
    }
    
    func loadData() {
        self.ref.child("discussions").observeSingleEvent(of: .value, with: {(snapshot) in
            if let value = snapshot.value as? NSDictionary {
                if let keys = value.allKeys as? [String] {
                    self.tableViewData.removeAll()
                    for key in keys {
                        if let d = value[key] as? [String: Any] {
                            let c = d["course"] as! String
                            if (self.course?.code)! == c {
                                let discussion = Discussion()
                                discussion.id = key
                                discussion.courseid = (self.course?.code)!
                                discussion.topic = d["topic"] as! String
                                if let date = self.df.date(from: (d["timestamp"] as! String)) {
                                    discussion.timestamp = date
                                }
                                let userId = d["postedBy"] as! String
                                self.ref.child("users").child(userId).observeSingleEvent(of: .value, with: { (snap) in
                                    if let u = snap.value as? NSDictionary {
                                        let name = u["name"] as! String
                                        discussion.owner = name
                                    }
                                    self.tableViewData.append(discussion)
                                    self.tableView.reloadData()
                                })
                            }
                        }
                    }
                }
            }
        })
    }
    
    

}
