//
//  AppDelegate.swift
//  ChatApp
//
//  Created by eren  on 17/11/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appContainer.router.start()
        return true
    }
}

