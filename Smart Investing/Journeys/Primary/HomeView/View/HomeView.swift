//
// Created by Manju Kiran
// Copyright (c) 2021 Manju Kiran. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController, HomeViewProtocol
{
    var presenter: HomeViewPresenterProtocol?
    @IBOutlet private var primaryButton: UIButton!
    
    /// Function to instantiate view controller with dependency injection of a view model;
    /// this approach is used for VCs instantiated from the storyboard
    ///
    /// - Parameter CommitElement:  model object to act as the data source
    /// - Returns: CommitDetailsViewController object
    class func create() -> HomeView? {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyBoard.instantiateViewController(withIdentifier: HomeView.storyboardIdentifier) as? HomeView {
            return vc
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "homescreen_title".localized()
        configurePrimaryButton()
    }
    
    private func configurePrimaryButton() {
        primaryButton.backgroundColor = AppTheme.themeColor
        primaryButton.titleLabel?.font = AppTheme.shared.fontFor(style: .headline)
        primaryButton.setTitle("homescreen_primary_button_title".localized(),
                               for: .normal)
        primaryButton.addTarget(self, action: #selector(didTapOnPrimaryButton), for: .touchUpInside)
    }
    
    @objc func didTapOnPrimaryButton() {
        presenter?.presentAchievementsScreen()
    }
    
    
}
