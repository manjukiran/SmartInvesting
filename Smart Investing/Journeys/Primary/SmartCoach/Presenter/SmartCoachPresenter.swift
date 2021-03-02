//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import Foundation

class SmartCoachPresenter: SmartCoachPresenterProtocol
{
    
    weak var view: SmartCoachViewProtocol?
    var interactor: SmartCoachInteractorInputProtocol?
    var router: SmartCoachRouterProtocol?
    
    init() {}
    
    func loadAchievements() {
        interactor?.loadAchievements()
    }
    
    func loadImage(urlString: String, completion: @escaping imageHandler) {
        interactor?.loadImage(urlString: urlString, completion: completion)
    }
    
    func presentDetailsForAchievement(_ achievement: Achievement) {
        router?.presentDetailsForAchievement(achievement)
    }
    
}

extension SmartCoachPresenter: SmartCoachInteractorOutputProtocol {
    
    func didLoadAchievements(_ achievements: AchievementsList) {
        // Note - this has been added to show more work done on the app as the local data fetch is instant
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2.0) { [weak self] in
            self?.view?.showAchievements(achievements)
        }
    }
    
    func failedToLoadAchievements(with error: Error) {
        view?.showError(error)
    }
    
}
