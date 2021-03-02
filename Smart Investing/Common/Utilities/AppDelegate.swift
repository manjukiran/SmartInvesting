//
//  AppDelegate.swift
//  Smart Investing
//
//  Created by Manju Kiran on 27/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupAppTheme()
        
        let homeScreenView = HomeViewRouter.createHomeViewModule()
        let navController = UINavigationController(rootViewController: homeScreenView)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
 
    func applicationWillTerminate(_ application: UIApplication) {
        // Save any contexts here before quitting
    }
    
    func setupAppTheme(){
        AppTheme.applyTheme()
    }
}

