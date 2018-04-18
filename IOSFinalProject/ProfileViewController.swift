//
//  ProfileViewController.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/13/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
class ProfileViewController: UIViewController, GIDSignInUIDelegate  {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var displayPicView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        
        displayPicView.layer.borderColor = UIColor.black.cgColor
        displayPicView.layer.borderWidth = 2
        displayPicView.layer.shadowColor = UIColor.black.cgColor
        displayPicView.layer.shadowOpacity = 0.8
        displayPicView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        let user = Auth.auth().currentUser
        
        nameLabel.text = user?.displayName
        emailLabel.text = user?.email
        
        DispatchQueue.main.async {
            
            let imageURl = user?.photoURL
            
            let session = URLSession(configuration: .default)
            
            //creating a dataTask
            let getImageFromUrl = session.dataTask(with: imageURl!) { (data, response, error) in
                
                //if there is any error
                if let e = error {
                    //displaying the message
                    print("Error Occurred: \(e)")
                    
                } else {
                    //in case of now error, checking wheather the response is nil or not
                    if (response as? HTTPURLResponse) != nil {
                        
                        //checking if the response contains an image
                        if let imageData = data {
                            
                            //getting the image
                            let image = UIImage(data: imageData)
                            
                            //displaying the image
                            self.displayPicView.image = image
                            
                        } else {
                            print("Image file is corrupted")
                        }
                    } else {
                        print("No response from server")
                    }
                }
            }
        
        
             //getImageFromUrl.resume()
        }
       
        
        //            cell.layer.shadowColor = UIColor.red.cgColor;
        //            cell.layer.shadowOpacity = 1;
        //            cell.layer.shadowOffset = CGSize(width: 5, height: 0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutBtn(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        UserDefaults.standard.set(false, forKey: "status")
        HomeSwitcher.updateRootVC()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
