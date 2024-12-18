//
//  SceneDelegate.swift
//  Fin
//
//  Created by shuruq alshammari on 17/06/1446 AH.
//

import Foundation
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        // التحقق إذا كان المستخدم قد شاهد صفحات الـ Onboarding
        if UserDefaults.standard.bool(forKey: "HasSeenOnboarding") {
            // إذا شاهدها من قبل، انتقل للشاشة الرئيسية
            let mainViewController = MainViewController() // استبدل بشاشتك الرئيسية
            window?.rootViewController = mainViewController
        } else {
            // إذا لم يشاهدها، انتقل لصفحات الـ Onboarding
            let onboardingView = OnboardingView()
            window?.rootViewController = onboardingView
        }
        
        window?.makeKeyAndVisible()
    }
}
