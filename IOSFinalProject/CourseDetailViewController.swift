//
//  CourseDetailViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/16/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase

class CourseDetailViewController: UIViewController {
    
    var course: Course?
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var instructorImageView: UIImageView!
    @IBOutlet weak var instructorName: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTextView.layer.borderWidth = 2
        detailTextView.layer.borderColor = UIColor.white.cgColor
        codeLabel.text = course?.code
        nameLabel.text = course?.name
        creditsLabel.text = String((course?.credits)!)
        levelLabel.text = course?.level
        typeLabel.text = course?.type
        ratingsLabel.text = String((course?.rating)!) + " (" + String((course?.noOfRatings)!) + ")"
        instructorName.text = course?.instructor.name
        detailTextView.text = course?.description
        let storage = Storage.storage()
        let imgRef = storage.reference(withPath: (course?.instructor.imageString)!)
        imgRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                self.instructorImageView.image = image
            }
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func viewCommentsBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "showComments", sender: sender)
    }
   
    @IBAction func viewDiscussionBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "showDiscussions", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CourseCommentsViewController {
            dest.course = course
        }
        if let dest = segue.destination as? DiscussionsTableViewController {
            dest.course = course
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
