//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import Foundation
import UIKit

class SmartCoachView: UIViewController {
    
    var presenter: SmartCoachPresenterProtocol?
    private var achievements: Achievements = Achievements()
    @IBOutlet private(set) var collectionView: UICollectionView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    /// Function to instantiate view controller with dependency injection of a view model;
    /// this approach is used for VCs instantiated from the storyboard
    ///
    /// - Parameter CommitElement:  model object to act as the data source
    /// - Returns: CommitDetailsViewController object
    class func create() -> SmartCoachView? {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyBoard.instantiateViewController(withIdentifier: SmartCoachView.storyboardIdentifier) as? SmartCoachView {
            return vc
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        refreshData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem?.title = " "
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        UIView.runOnMainThread(after: 0.3) { [weak self] in
            guard let self = self else { return }
            self.configureCollectionViewFlow()
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
        }        
    }
    
    private func configureUI(){
        self.title = "homescreen_title".localized()
        configureCollectionView()
        configureNavBar()
        configureActivityIndicator()
    }
   
    private func configureNavBar(){
        let menuBtn = UIButton(type: .custom)
        menuBtn.setImage(UIImage(named:"InfoIcon"), for: .normal)
        menuBtn.contentMode = .scaleAspectFit
    
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        menuBarItem.customView?.applySize(width: 30, height: 30)
        self.navigationItem.rightBarButtonItem = menuBarItem

    }
    
    private func configureCollectionView() {
        collectionView.register(cell: PlaceHolderCell.self, nibName: PlaceHolderCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        configureCollectionViewFlow()
        configureRefreshControl()
    }
    
    private func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = AppTheme.themeColor
        refreshControl.attributedTitle = NSAttributedString(string: "updating_achievement_list_data_message".localized())
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        collectionView.alwaysBounceVertical = true
    }
    
    private func configureCollectionViewFlow() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.invalidateLayout()
            if UIDevice.current.isWiderThanTaller() {
                layout.scrollDirection = .horizontal
            } else {
                layout.scrollDirection = .vertical
            }
        }
    }
    
    private func configureActivityIndicator() {
        activityIndicator.color = AppTheme.actionItemColor
        activityIndicator.hidesWhenStopped = true
    }
    
    @objc private func refreshData() {
        activityIndicator.startAnimating()
        presenter?.loadAchievements()
    }
    
}

extension SmartCoachView: SmartCoachViewProtocol {
    
    func showAchievements(_ achievements: AchievementsList) {
        if achievements.success {
            self.achievements = achievements.achievements
        } else {
            showError(DownloadError.serverError)
        }
        
        
        UIView.runOnMainThread { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.collectionView.refreshControl?.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        
        UIView.runOnMainThread { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            let alert = UIAlertController.generateSingleActionAlert(title: "achievements_load_fail_title".localized(),
                                                                    message: "achievements_load_fail_message".localized(),
                                                                    okHandler: {_ in })
            self.present(alert, animated: true, completion: {
                self.collectionView.refreshControl?.endRefreshing()
                self.collectionView.reloadData()
            })
        }
    }
    
}

extension SmartCoachView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count > 0 ? achievements.count : 1 // Provide 1 for the placeholder in case its empty
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if achievements.count > 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementViewCell.reuseIdentifier, for: indexPath) as? AchievementViewCell {
                let achievement = achievements[indexPath.row]
                cell.configureWithAchievement(achievement)
                if let image = achievement.bgImage {
                    cell.configureImage(image: image)
                } else {
                    presenter?.loadImage(urlString: achievement.bgImageURL, completion: { result in
                        switch result{
                        case .success(let image):
                            UIView.runOnMainThread {
                                achievement.bgImage = image
                                collectionView.reloadItems(at: [indexPath])
                            }
                        case .failure(let error):
                            debugLog(error.rawValue)
                        }
                    })
                }
                
                return cell
            }
        } else{
            // Placeholder cell when no data is received from the backend
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceHolderCell.reuseIdentifier,
                                                             for: indexPath) as? PlaceHolderCell {
                let imageName = self.activityIndicator.isAnimating ? "planet_icon" : "no_data_icon"
                let placeHolderText = self.activityIndicator.isAnimating ?
                    "data_fetch_in_progress" : "no_data_placeholder_message"
                cell.configureCell(imageName: imageName, text: placeHolderText.localized())
                return cell
            }
        }
        return UICollectionViewCell()
        
    }
    
    
}

extension SmartCoachView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let achievement = achievements[indexPath.item]
        presenter?.presentDetailsForAchievement(achievement)
    }
    
}

extension SmartCoachView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        let isLandScape = UIDevice.current.isWiderThanTaller()
        if isLandScape {
            return CGSize(width: 400, height: size.height)
        } else {
            return CGSize(width: size.width, height: 230)
        }
        
    }
}
