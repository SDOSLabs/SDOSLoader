//
//  AppDelegate.swift
//  SDOSLoader
//
//  Created by Rafael Fernandez Alvarez on 01/06/2018.
//  Copyright © 2018 SDOS. All rights reserved.
//

import Foundation
import UIKit
import SDOSLoader
import SDOSCustomLoader
import SDOSSwiftExtension

extension LoaderObject {
    enum style {
        static var styleRed: Style<SDOSLoaderProgress> {
            return Style<SDOSLoaderProgress> {
                $0.progressColor = .red
            }
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard.init(name: ExampleLoader, bundle: nil)
        let viewcontroller = storyboard.instantiateInitialViewController()
        
        var loader = LoaderManager.loader(loaderType: .indeterminateCircular(LoaderObject.style.styleRed), inView: viewcontroller?.view, size: nil)
        LoaderManager.showLoader(loader)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            LoaderManager.hideLoader(loader)
        }
        
        self.window?.rootViewController = viewcontroller
        self.window?.makeKeyAndVisible()
        
        return true
        
    }
}
