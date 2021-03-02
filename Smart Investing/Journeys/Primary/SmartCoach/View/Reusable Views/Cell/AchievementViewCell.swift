//
//  AchievementViewCell.swift
//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//

import UIKit

class AchievementViewCell: UICollectionViewCell {
    
    @IBOutlet private(set) var levelIndicator: LevelNumberIndicator!
    @IBOutlet private(set) var levelImageView: UIImageView!
    @IBOutlet private(set) var progressBar: UIProgressView!
    @IBOutlet private(set) var currentProgress: UILabel!
    @IBOutlet private(set) var totalProgress: UILabel!
    @IBOutlet private(set) var inaccessibilityLayer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        currentProgress.configureFor(style: .caption2)
        totalProgress.configureFor(style: .caption2)
        progressBar.tintColor = AppTheme.actionItemColor
        progressBar.backgroundColor = UIColor(white: 1, alpha: 0.8)
        inaccessibilityLayer.backgroundColor = UIColor(white: 1, alpha: 0.6)
        levelImageView.applyRadius(10.0)
        progressBar.applyRadius(5.0)
        levelIndicator.textAlignment = .center
        levelIndicator.numberOfLines = 0
        addShadow()
    }
    
    override func prepareForReuse() {
        currentProgress.text = ""
        totalProgress.text = ""
        progressBar.progress = 0
        levelImageView.image = nil
    }
    
    func configureWithAchievement(_ achievement : Achievement) {
        currentProgress.text = "\(achievement.progress) pts"
        totalProgress.text = "\(achievement.total) pts"
        progressBar.progress = Float(achievement.progress) / Float(achievement.total)
        levelIndicator.configure(with: achievement.level)        
        inaccessibilityLayer.isHidden = achievement.accessible
        contentView.layer.shadowOpacity = achievement.accessible ? 0.6 : 0.0
        makeLevelIndicatorRounded()
    }

    private func makeLevelIndicatorRounded() {
        UIView.runOnMainThread(after: 0.1) { [weak self] in
            self?.levelIndicator.transformToRoundedView()
        }
    }
    
    func configureImage(image: UIImage){
        self.levelImageView.image = image
    }
    
    private func addShadow() {
        contentView.layer.cornerRadius = 5.0
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.6
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 2
        
        // Ask iOS to cache the rendered shadow so that it doesn't need to be redrawn
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
    }
    
}

