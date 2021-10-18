//
//  AppDelegate.swift
//  Cocktail Heaven
//
//  Created by Stephen Learmonth on 18/10/2021.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemTeal
        

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        return true
    }
}
