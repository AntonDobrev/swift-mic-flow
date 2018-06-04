						//
//  AppDelegate.swift
//  KinveyMICLogin
//
//  Created by Victor Hugo on 2017-09-05.
//  Copyright © 2017 Kinvey. All rights reserved.
//

import UIKit
import Kinvey

let mobileUrlSchemeRedirect = URL(string: "")! // mykinveyappatwork://
let apiKey = ""
let appSecret = ""
let authSamlServiceId = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Kinvey.sharedClient.initialize(
            appKey: apiKey,
            appSecret: appSecret)
//        ){
//            switch $0 {
//            case .success(let user):
//                if let user = user {
//                    print("User: \(user)")
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
   //     Kinvey.sharedClient.micApiVersion = .v3
        Kinvey.sharedClient.logNetworkEnabled = true
        Kinvey.logLevel = .debug
        
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
    
    // this is required to be implemented - handles the redirect from MIC to the app via the custom URL scheme
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

     //   var opts = Options(authServiceId: authSamlServiceId)
     //   opts.authServiceId = authSamlServiceId

        if User.login(redirectURI: mobileUrlSchemeRedirect, micURL: url, options: Kinvey.sharedClient.options) {
            return true
        }

        return false
    }
}

