//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import UIKit

protocol SmartCoachViewProtocol: AutoMockable, UIViewController
{
    var presenter: SmartCoachPresenterProtocol? { get set }
    
    func showAchievements(_ achievements: AchievementsList)
    func showError(_ error: Error)
}

protocol SmartCoachRouterProtocol: AutoMockable
{
    static func presentSmartCoachModule(module:SmartCoachViewProtocol, fromView sourceView: UIViewController)
    static func createSmartCoachModule() -> SmartCoachViewProtocol
    
    func presentDetailsForAchievement(_ achievement: Achievement)
}

protocol SmartCoachPresenterProtocol: AutoMockable
{
    var view: SmartCoachViewProtocol? { get set }
    var interactor: SmartCoachInteractorInputProtocol? { get set }
    var router: SmartCoachRouterProtocol? { get set }
    
    func loadAchievements()
    func loadImage(urlString: String, completion: @escaping imageHandler)

    func presentDetailsForAchievement(_ achievement: Achievement)
}

protocol SmartCoachInteractorOutputProtocol: AutoMockable
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    
    func didLoadAchievements(_ achievements: AchievementsList)
    func failedToLoadAchievements(with error: Error)
}

protocol SmartCoachInteractorInputProtocol: AutoMockable
{
    var presenter: SmartCoachInteractorOutputProtocol? { get set }
    var dataManager: SmartCoachDataManagerProtocol? { get set }
    
    func loadAchievements()
    func loadImage(urlString: String, completion: @escaping imageHandler)
}

protocol SmartCoachDataManagerProtocol: AutoMockable
{
    var dataManager: DataSyncManager { get }
    
    func loadAchievements(completion: @escaping genericDataFetchHandler<AchievementsList>)
    func loadImage(urlString: String, completion: @escaping imageHandler) 
}
