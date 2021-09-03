//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Nicolas Rostan on 5/8/21.
//

import UIKit
import DLDataCollectorSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let settings = DLSettings(apiKey: "API KEY", env: .sandbox, logLevel: .silent)
        DLCollector.shared.setUp(settings)
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
