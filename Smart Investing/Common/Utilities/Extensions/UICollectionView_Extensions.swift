//
//  UITableView_Extensions.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import Foundation


import UIKit

// MARK: - This set of extension is all about registering TableView cells

extension UICollectionView {
    
    func register<T : UICollectionViewCell>(cell: T.Type, nibName:String) {
        register(UINib.init(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
    
    func reloadOnMainThread() {
        UIView.runOnMainThread { [weak self] in
            self?.reloadData()
        }
    }
}
