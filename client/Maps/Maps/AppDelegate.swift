//
//  AppDelegate.swift
//  Maps
//
//  Created by Leonardo Piovezan on 07/04/19.
//  Copyright © 2019 Leonardo Piovezan. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appCoordinator: AppCoordinator!
    var container: DefaultContainer!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(Constants.Keys.mapsKey)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.container = DefaultContainer()

        self.appCoordinator = AppCoordinator(window: self.window!,
                                             container: self.container)
        self.appCoordinator.start()

        self.window?.makeKeyAndVisible()
        return true
    }
}
