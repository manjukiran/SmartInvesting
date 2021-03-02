//
//  UIView_Extensions.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import UIKit

extension UIView {
    
    /// UIView utility to ensure provided block runs on Main Thread
    ///
    /// Also helps avoid EXC_BAD_INSTRUCTION errors
    ///
    /// - Parameter block: closure containing the code to run
    class func runOnMainThread(after: TimeInterval = 0, block: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + after) {
            block()
        }
    }
    
    
    func applyRadius(_ radius: CGFloat) {
        self.layer.cornerRadius =  radius
        self.clipsToBounds = true
    }
    
    func transformToRoundedView() {
        let maxRadius = max(self.frame.size.width, self.frame.size.height)
        self.layer.cornerRadius = maxRadius / 2.0
        self.layer.masksToBounds = true        
    }
    
    func applyStroke(strokeWidth: CGFloat, strokeColor: UIColor, cornerRadius: CGFloat = 0.0) {
        self.layer.borderWidth = strokeWidth
        self.layer.borderColor = strokeColor.cgColor
        if cornerRadius > 0 {
            self.layer.cornerRadius = cornerRadius
        }
        self.layer.masksToBounds = true
    }
    
}
