//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import Foundation

class SmartCoachInteractor: SmartCoachInteractorInputProtocol
{
    
    weak var presenter: SmartCoachInteractorOutputProtocol?
    var dataManager: SmartCoachDataManagerProtocol?
    
    init(){}
    
    func loadAchievements() {
        dataManager?.loadAchievements { [weak self] result in
            guard let presenter = self?.presenter else { return }
            switch result {
            case .success(let achievements):
                presenter.didLoadAchievements(achievements)
            case .failure(let error):
                presenter.failedToLoadAchievements(with: error)
            }
        }
    }
    
    func loadImage(urlString: String, completion: @escaping imageHandler) {       
        dataManager?.loadImage(urlString: urlString, completion: completion)
    }
    
}
