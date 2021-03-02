//
// Created by Manju Kiran
// Copyright (c) 2021 Manju Kiran. All rights reserved.
//

import Foundation

class HomeViewWireFrame: HomeViewWireFrameProtocol
{
    class func presentHomeViewModule(fromView view: AnyObject)
    {
        // Generating module components
        var view: HomeViewViewProtocol = HomeViewView()
        var presenter: protocol<HomeViewPresenterProtocol, HomeViewInteractorOutputProtocol> = HomeViewPresenter()
        var interactor: HomeViewInteractorInputProtocol = HomeViewInteractor()
        var APIDataManager: HomeViewAPIDataManagerInputProtocol = HomeViewAPIDataManager()
        var localDataManager: HomeViewLocalDataManagerInputProtocol = HomeViewLocalDataManager()
        var wireFrame: HomeViewWireFrameProtocol = HomeViewWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
    }
}