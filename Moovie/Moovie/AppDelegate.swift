//
//  AppDelegate.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 03/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: SDCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Setup Coordinator
        let navController = UINavigationController()
        coordinator = SDCoordinator(navigationController: navController)
        coordinator?.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }


}

