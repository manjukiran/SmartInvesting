//
//  ProgressIndicatorView.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//

import UIKit

class ProgressIndicatorView: UIView {
    
    weak var progressBar: UILabel?
    weak var currentProgressLabel: UILabel?
    weak var totalProgressLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
}
