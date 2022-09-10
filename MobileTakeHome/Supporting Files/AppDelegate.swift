//
//  AppDelegate.swift
//  MobileTakeHome
//
//  Created by André Alves on 09/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    lazy var initialViewController: UIViewController = {
        let viewController = MainViewController()
        viewController.presenter = MainPresenter(view: viewController)
        return viewController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = self.initialViewController
        window?.makeKeyAndVisible()
        return true
    }
    
}

