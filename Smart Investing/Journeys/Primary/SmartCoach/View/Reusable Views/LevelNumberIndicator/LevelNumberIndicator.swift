//
//  LevelNumberIndicator.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//

import UIKit

protocol LevelNumberIndicating: class {
    func configure(with levelNumber: String)
}

class LevelNumberIndicator: UILabel {
        
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

extension LevelNumberIndicator: LevelNumberIndicating {
    
    func configure(with levelNumber: String) {
        self.attributedText = self.generatedAttributedString(for: levelNumber)
    }
}

extension LevelNumberIndicator {

    private func setupView() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.9)
        self.transformToRoundedView()
    }

    
    private func generatedAttributedString(for levelNumber: String) -> NSAttributedString {
        let titleFont = AppTheme.shared.fontFor(style: .title2)
        let titleFontColor = AppTheme.shared.fontColorFor(style: .title2)
        
        let levelNumberFont = AppTheme.shared.fontFor(style: .largeTitle)
        let levelNumberFontColor = AppTheme.shared.fontColorFor(style: .largeTitle)

        let titleFontAttributes: [NSAttributedString.Key: Any] = [
            .font: titleFont,
            .foregroundColor: titleFontColor,
        ]
        
        let levelNumberFontAttributes: [NSAttributedString.Key: Any] = [
            .font: levelNumberFont,
            .foregroundColor: levelNumberFontColor,
        ]
        
        let titleString = NSMutableAttributedString(string: "\n" + "level_title".localized() + "\n", attributes: titleFontAttributes)
        let levelNumberString = NSAttributedString(string: levelNumber.localized(), attributes: levelNumberFontAttributes)
        titleString.append(levelNumberString)
        return titleString
    }
    
}

