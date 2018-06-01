//
//  AppDelegate.swift
//  SDOSLoader
//
//  Created by Rafael Fernandez Alvarez on 01/06/2018.
//  Copyright © 2018 SDOS. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard.init(name: ExampleLoader, bundle: nil)
        let viewcontroller = storyboard.instantiateInitialViewController()
        
        self.window?.rootViewController = viewcontroller
        self.window?.makeKeyAndVisible()
        
        return true
        
    }
}
