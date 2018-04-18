//
//  HomeSwitcher.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/13/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import Foundation
import UIKit

class HomeSwitcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        
        print(status)
        
        
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! HomeTabBarViewController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
    
}
