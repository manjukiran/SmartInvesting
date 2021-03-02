//
//  UITextView_Extensions.swift
//  Cake List
//
//  Created by Manju Kiran on 17/09/2019.
//  Copyright © 2019 Manju Kiran. All rights reserved.
//

import UIKit

extension UITextView {
 
    func configureFor(style: UIFont.TextStyle) {
        self.font = AppTheme.shared.fontFor(style: style)
        self.textColor = AppTheme.shared.fontColorFor(style: style)
    }
    
}
