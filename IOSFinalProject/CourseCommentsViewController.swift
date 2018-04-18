//
//  CourseCommentsViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/16/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase

class CourseCommentsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var commentsCollectionView: UICollectionView!
    var ref:DatabaseReference!
    var course:Course?
    var df = DateFormatter()
    let user = Auth.auth().currentUser!
    
    var collectionViewData: [CourseComments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentsCollectionView.delegate = self
        commentsCollectionView.dataSource = self
        
        commentTextView.layer.borderWidth = 3
        commentTextView.layer.borderColor = sendButton.backgroundColor?.cgColor
        commentTextView.layer.cornerRadius = 8
        sendButton.layer.cornerRadius = 8
        
        ref = Database.database().reference()
        
        
        df.dateFormat = "MM-dd-yyyy"
        df.timeStyle = DateFormatter.Style.none
        df.dateStyle = DateFormatter.Style.short
        
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let user = Auth.auth().currentUser!
        self.ref.child("users").child(user.uid).child("courses").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild(self.course!.code){
                self.sendButton.isEnabled = true
                self.commentTextView.text = ""
                self.commentTextView.textColor = UIColor.black
                
            } else {
                self.sendButton.isEnabled = false
                self.commentTextView.text = "Can't comment. You have not taken this course"
                self.commentTextView.textColor = UIColor.lightGray
                self.commentTextView.isEditable = false
            }
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commentsCell", for: indexPath) as! CourseCommentsCollectionViewCell
        cell.postedByLabel.text = collectionViewData[indexPath.section].fromUser
        cell.commentLabel.text = collectionViewData[indexPath.section].comment
        cell.timestampLabel.text =  df.string(from: collectionViewData[indexPath.section].timestamp)
        return cell
    }

    @IBAction func postComments(_ sender: UIButton) {
        let message = commentTextView.text as String
        if !(message.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            let ref = self.ref.child("comments").childByAutoId()
            
            ref.setValue(["message" : message, "courseCode": course?.code, "postedBy" : user.uid, "postedDate" : df.string(from: Date())])
            loadData()
            self.commentTextView.text = ""
        }
    }
    
    func loadData () {
        self.ref.child("comments").observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                if let keys = value.allKeys as? [String] {
                    for key in keys {
                        if let c = value[key] as? [String: Any] {
                            self.collectionViewData.removeAll()
                            let code = c["courseCode"] as! String
                            if (code == self.course?.code) {
                                let comment = CourseComments()
                                comment.comment = c["message"] as! String
                                if let date = self.df.date(from: (c["postedDate"] as! String)) {
                                    comment.timestamp = date
                                }
                                let code = self.course?.code
                                comment.courseCode = code!
                                let userId = c["postedBy"] as! String
                                self.ref.child("users").child(userId).observeSingleEvent(of: .value, with: { (snap) in
                                    if let u = snap.value as? NSDictionary {
                                        let name = u["name"] as! String
                                        comment.fromUser = name
                                    }
                                    self.collectionViewData.append(comment)
                                    self.commentsCollectionView.reloadData()
                                })
                            }
                        }
                    }
                    self.commentsCollectionView.reloadData()
                }
            }
        })
    }
    

}
