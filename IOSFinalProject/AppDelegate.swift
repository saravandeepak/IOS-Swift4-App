//
//  AppDelegate.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/12/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    var ref:DatabaseReference!
    let appVariables = AppVariables.sharedInstance
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //Database Reference
        ref = Database.database().reference()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        HomeSwitcher.updateRootVC()
        
//        for instructor in populateInstructors() {
//            self.ref.child("instructors").child(instructor.name).setValue(["name": instructor.name, "title": instructor.title, "about": instructor.about, "imageString":instructor.imageString])
//            //self.ref.child("instructors").child(instructor.name).setValue(instructor)
//        }
//
//        for course in populateCourses() {
//            self.ref.child("courses").child(course.code).setValue(["code": course.code, "name": course.name, "description": course.description, "instructor": course.instructor.name, "credits": course.credits, "type": course.type, "level": course.level, "rating": course.rating, "noOfRatings": course.noOfRatings])
//        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            return
        } else {
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                // User is signed in
                // ...
                if let user  = user {
                    self.ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
                        if snapshot.hasChild(user.uid){
                            print("user exists")
                        }else{
                            print("user doesn't exist")
                            print(user)
                            print(user.displayName!)
                            print(user.email!)
                            print(user.photoURL!)
                            self.ref.child("users").child(user.uid).setValue(["name": user.displayName!, "email": user.email!, "photoURL": user.photoURL!.absoluteString, "courses": [], ])
                        }
                    })
                    UserDefaults.standard.set(true, forKey: "status")
                    HomeSwitcher.updateRootVC()
                }
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }


}

