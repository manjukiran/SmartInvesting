//
//  AppTheme.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import UIKit

class AppTheme: NSObject {

    static let shared = AppTheme()
    static let themeColor = UIColor(hexString: AppConstants.themeColorHex)
    static let actionItemColor = UIColor(hexString: AppConstants.actionItemColor)

    override private init() {
        super.init()
        
    }
    
    /// Apply app themes to common elements based on colors so that this does not need to be setup separately for all UI Elements
    class func applyTheme() {
        AppTheme.shared.applyNavigationBarTheme()
        AppTheme.shared.applyTabBarTheme()
    }
    
    /// Retrieve scaled font for accessibility reasons
    /// - Parameter style: text style for the TEXT to be displayed
    func fontFor(style: UIFont.TextStyle) -> UIFont {
        if #available(iOS 11.0, *) {
            let fontMetrics = UIFontMetrics(forTextStyle: style)
            return fontMetrics.scaledFont(for: UIFont.fontForStyle(style: style))
        } else {
            return UIFont.fontForStyle(style: style)
        }
    }
    
    func fontColorFor(style: UIFont.TextStyle) -> UIColor {
        return UIFont.fontColorForStyle(style: style)
    }
    
    
    /// Applies Theme colors to all nav bars
    private func applyNavigationBarTheme() {
        UINavigationBar.appearance().barTintColor = AppTheme.themeColor
        UINavigationBar.appearance().backgroundColor = AppTheme.themeColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Make Back Title Clear so as to only make < button visible
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .highlighted)
    }
    
    /// /// Applies Theme colors to all tab bars
    private func applyTabBarTheme() {
        UITabBar.appearance().barTintColor = AppTheme.themeColor
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.white
    }
}
