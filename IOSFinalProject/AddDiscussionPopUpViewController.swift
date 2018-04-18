//
//  AddDiscussionPopUpViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/17/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase

class AddDiscussionPopUpViewController: UIViewController {

    var course: Course?
    var ref: DatabaseReference!
    var df = DateFormatter()
    var delegate: DiscussionsTableViewController!
    
    @IBOutlet weak var topicLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        df.dateFormat = "MM-dd-yyyy"
        df.timeStyle = DateFormatter.Style.none
        df.dateStyle = DateFormatter.Style.short
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addDiscussionBtn(_ sender: Any) {
        let topic = topicLabel.text
        let courseId = course?.code
        let user = Auth.auth().currentUser!
        let timestamp = df.string(from: Date())
        let refDiscussion = ref.child("discussions").childByAutoId()
        refDiscussion.setValue(["course": courseId, "topic": topic, "postedBy": user.uid, "timestamp": timestamp])
        dismiss(animated: true, completion: nil)
        delegate.loadData()
        
    }

}
