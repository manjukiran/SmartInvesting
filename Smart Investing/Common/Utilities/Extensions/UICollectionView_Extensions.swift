//
//  UITableView_Extensions.swift
//  Cake List
//
//  Created by Manju Kiran on 21/09/2019.
//  Copyright © 2019 Manju Kiran. All rights reserved.
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
