//
//  PlaceHolderCell.swift
//  Cake List
//
//  Created by Manju Kiran on 21/09/2019.
//  Copyright © 2019 Manju Kiran. All rights reserved.
//

import UIKit

class PlaceHolderCell: UICollectionViewCell {
    
    @IBOutlet weak var placeholderImage: UIImageView!
    @IBOutlet weak var placeholderTextView: UITextView!
    
    override func awakeFromNib() {
        self.placeholderTextView.configureFor(style: .subheadline)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.placeholderTextView.configureFor(style: .subheadline)
        self.placeholderImage.image = nil
        self.placeholderTextView.text = ""
    }
    
    func configureCell(imageName: String, text: String) {
        self.placeholderImage.image = UIImage(named: imageName)
        self.placeholderTextView.text = text
    }
}
