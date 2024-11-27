//
//  AppDelegate.swift
//  CineTrack
//
//  Created by Gerson Vieira on 20/11/24.
//

import Foundation
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        return true
    }
    // MARK: URL Schemes
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
////        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
////            return true
////        }
//        // other URL handling goes here.
//        return false
//    }
}
