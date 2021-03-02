//
//  Device_Extensions.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//

import UIKit

extension UIDevice {
    
    func isWiderThanTaller() -> Bool{
        orientation == .landscapeLeft || orientation == .landscapeRight
    }
    
}
