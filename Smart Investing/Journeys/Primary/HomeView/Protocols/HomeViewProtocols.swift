//
// Created by Manju Kiran
// Copyright (c) 2021 Manju Kiran. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: UIViewController
{
    var presenter: HomeViewPresenterProtocol? { get set }
}

protocol HomeViewRouterProtocol: class
{
    static func createHomeViewModule() -> UIViewController

    func presentAchievementsScreen(from source: UIViewController)
}

protocol HomeViewPresenterProtocol: class
{
    var view: HomeViewProtocol? { get set }
    var router: HomeViewRouterProtocol? { get set }
    
    func presentAchievementsScreen()
}

