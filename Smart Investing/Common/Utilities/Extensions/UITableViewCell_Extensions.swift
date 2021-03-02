//
//  UITableViewCell.swift
//  Cake List
//
//  Created by Manju Kiran on 21/09/2019.
//  Copyright © 2019 Manju Kiran. All rights reserved.
//

import UIKit

protocol ReusableCellIdentifying {
    
    /// Simple utility to help access the reuse identifier of every cell class without having to rely on hardcoded strings
    static var reuseIdentifier: String { get }
}

extension ReusableCellIdentifying {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableCellIdentifying { }
extension UICollectionViewCell: ReusableCellIdentifying { }
