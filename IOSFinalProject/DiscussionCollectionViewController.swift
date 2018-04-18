//
//  DiscussionCollectionViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/17/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase

class DiscussionCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var topicLabel: UITextView!
    
    @IBOutlet weak var replyTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewData: [Reply] = []
    var df = DateFormatter()
    var discussion: Discussion?
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        df.dateFormat = "MM-dd-yyyy"
        df.timeStyle = DateFormatter.Style.none
        df.dateStyle = DateFormatter.Style.short
        
        ref = Database.database().reference()
        
        postedByLabel.text = discussion?.owner
        topicLabel.text = discussion?.topic
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        replyTextView.layer.borderWidth = 3
        replyTextView.layer.borderColor = postedByLabel.textColor?.cgColor
        replyTextView.layer.cornerRadius = 8
        
        loadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discussionCell", for: indexPath) as! CourseCommentsCollectionViewCell
        cell.postedByLabel.text = collectionViewData[indexPath.section].postedBy
        cell.commentLabel.text = collectionViewData[indexPath.section].message
        cell.timestampLabel.text =  df.string(from: collectionViewData[indexPath.section].timestamp)
        return cell
    }

    @IBAction func doReply(_ sender: UIButton) {
        let reply = replyTextView.text as String
        let user = Auth.auth().currentUser
        if (reply.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
            let replyRef = self.ref.child("replies").childByAutoId()
            replyRef.setValue(["dicussionId": discussion?.id, "message": reply, "postedBy": user?.uid,"timestamp": df.string(from: Date()) ])
            replyTextView.text = ""
            loadData()
        }
        
    }
    
    func loadData() {
        self.ref.child("replies").observeSingleEvent(of: .value, with: {(snapshot) in
            if let value = snapshot.value as? NSDictionary {
                if let keys = value.allKeys as? [String] {
                    self.collectionViewData.removeAll()
                    for key in keys {
                        if let r = value[key] as? [String: Any] {
                            let disId = r["dicussionId"] as! String
                            if disId == self.discussion?.id {
                                let reply = Reply()
                                reply.discussionId = disId
                                reply.message = r["message"] as! String
                                if let date = self.df.date(from: (r["timestamp"] as! String)) {
                                    reply.timestamp = date
                                }
                                let userId = r["postedBy"] as! String
                                self.ref.child("users").child(userId).observeSingleEvent(of: .value, with: { (snap) in
                                    if let u = snap.value as? NSDictionary {
                                        let name = u["name"] as! String
                                        reply.postedBy = name
                                    }
                                    self.collectionViewData.append(reply)
                                    self.collectionView.reloadData()
                                })
                            }
                        }
                    }
                }
            }
        })
    }
}
