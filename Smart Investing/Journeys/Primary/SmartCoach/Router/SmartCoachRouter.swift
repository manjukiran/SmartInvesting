//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import Foundation
import UIKit

typealias SmartCoachPresenting = SmartCoachPresenterProtocol & SmartCoachInteractorOutputProtocol

class SmartCoachRouter: SmartCoachRouterProtocol {
    
    static func createSmartCoachModule() -> SmartCoachViewProtocol {
        
        // Generating module components
        let view: SmartCoachViewProtocol = SmartCoachView.create() ?? SmartCoachView()
        
        let presenter: SmartCoachPresenting = SmartCoachPresenter()
        let interactor: SmartCoachInteractorInputProtocol = SmartCoachInteractor()
        
        let dataSyncManager = DataSyncManager(networkDataUtility: NetworkDataUtility())
        let dataManager: SmartCoachDataManager = SmartCoachDataManager(dataManager:dataSyncManager )

        let router: SmartCoachRouterProtocol = SmartCoachRouter()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        
        return view
    }
    

    static func presentSmartCoachModule(module:SmartCoachViewProtocol,
                                        fromView sourceView: UIViewController) {
        
        sourceView.navigationController?.pushViewController(module, animated: true)
        
    }
    
    func presentDetailsForAchievement(_ achievement: Achievement) {
        // TODO: - Implement Details Feature - in debug mode this line will crash to alert the developer
        debugLog("Feature Yet to be implemented to show detail")
    }
    
}
