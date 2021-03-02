//
//  UIViewController_Extensions.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Simple utility to help access the storyboard identifier of every view controller class without having to rely on hardcoded strings
    public static var storyboardIdentifier: String {
        return String(describing: self)
    }

}
