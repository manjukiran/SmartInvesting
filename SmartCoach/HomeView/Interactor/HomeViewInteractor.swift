//
// Created by Manju Kiran
// Copyright (c) 2021 Manju Kiran. All rights reserved.
//

import Foundation

class HomeViewInteractor: HomeViewInteractorInputProtocol
{
    weak var presenter: HomeViewInteractorOutputProtocol?
    var APIDataManager: HomeViewAPIDataManagerInputProtocol?
    var localDatamanager: HomeViewLocalDataManagerInputProtocol?
    
    init() {}
}