//
// Created by Manju Kiran
// Copyright (c) 2021 Manju Kiran. All rights reserved.
//

import Foundation

class HomeViewPresenter: HomeViewPresenterProtocol
{
    weak var view: HomeViewProtocol?
    var router: HomeViewRouterProtocol?

    init() {}
    
    func presentAchievementsScreen() {
        guard let view = view else { return }
        router?.presentAchievementsScreen(from: view)
    }
    
}
