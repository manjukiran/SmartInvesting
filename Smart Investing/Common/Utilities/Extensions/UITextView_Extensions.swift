//
//  UITextView_Extensions.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import UIKit

extension UITextView {
 
    func configureFor(style: UIFont.TextStyle) {
        self.font = AppTheme.shared.fontFor(style: style)
        self.textColor = AppTheme.shared.fontColorFor(style: style)
    }
    
}
