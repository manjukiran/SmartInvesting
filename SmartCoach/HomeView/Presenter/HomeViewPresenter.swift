//
// Created by Manju Kiran
// Copyright (c) 2021 Manju Kiran. All rights reserved.
//

import Foundation

class HomeViewPresenter: HomeViewPresenterProtocol, HomeViewInteractorOutputProtocol
{
    weak var view: HomeViewViewProtocol?
    var interactor: HomeViewInteractorInputProtocol?
    var wireFrame: HomeViewWireFrameProtocol?
    
    init() {}
}