//
// Created by Manju Kiran
// Copyright (c) 2021 Manju Kiran. All rights reserved.
//

import Foundation
import UIKit

class HomeViewRouter: HomeViewRouterProtocol
{
    class func createHomeViewModule() -> UIViewController
    {
        // Generating module components
        let view: HomeViewProtocol = HomeView.create() ?? HomeView()
        let presenter: HomeViewPresenterProtocol = HomeViewPresenter()
        let router: HomeViewRouterProtocol = HomeViewRouter()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        return view
    }
    
    func presentAchievementsScreen(from source: UIViewController) {
        SmartCoachRouter.presentSmartCoachModule(module: SmartCoachRouter.createSmartCoachModule(),
                                                 fromView: source)
    }
    
}
