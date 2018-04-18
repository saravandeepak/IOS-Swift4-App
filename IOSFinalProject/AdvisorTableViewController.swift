//
//  AdvisorTableViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/15/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase



struct advCellData {
    var opened = Bool()
    var instructor = Instructor()
    var image:UIImage? = UIImage()
}

class AdvisorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var advisorTableView: UITableView!
    var tableViewData = [advCellData]()
    
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        advisorTableView.delegate = self
        advisorTableView.dataSource = self
        
        ref = Database.database().reference()
        
        self.ref.child("instructors").observe(.value, with: {(snap) in
            if let value = snap.value as? NSDictionary {
                if let keys = value.allKeys as? [String] {
                    for key in keys {
                        if let i = value[key] as? [String: Any] {
                            let instructor = Instructor()
                            instructor.name = i["name"] as! String
                            instructor.about = i["about"] as! String
                            instructor.title = i["title"] as! String
                            instructor.imageString = i["imageString"] as! String
                            let storage = Storage.storage()
                            let imgRef = storage.reference(withPath: instructor.imageString)
                            imgRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    let image = UIImage(data: data!)
                                    self.tableViewData.append(advCellData.init(opened: false, instructor: instructor, image: image))
                                    self.advisorTableView.reloadData()
                                }
                            }
                        }
                    }
                    print("Call this please")
                    self.advisorTableView.reloadData()
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! AdvisorTitleTableViewCell
            cell.nameLabel.text = tableViewData[indexPath.section].instructor.name
            cell.titleLabel.text = tableViewData[indexPath.section].instructor.title
            cell.displayImageView.image = tableViewData[indexPath.section].image
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! AdvisorDetailTableViewCell
            cell.detailLabel.text = tableViewData[indexPath.section].instructor.about
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
            //do action for inner cells
        }
    }

}
