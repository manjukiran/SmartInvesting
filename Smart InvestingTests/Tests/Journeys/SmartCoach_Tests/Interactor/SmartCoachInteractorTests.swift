//
//  SmartCoachInteractorTests.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 01/03/2021.
//

import XCTest
@testable import Smart_Investing

class SmartCoachInteractorTests: XCTestCase {

    var interactor: SmartCoachInteractor!
    var dataManager = SmartCoachDataManagerProtocolMock()
    var presenter = SmartCoachPresenterProtocolMock()
    
    override func setUpWithError() throws {
        interactor = SmartCoachInteractor()
        interactor.dataManager = dataManager
        interactor.presenter = presenter        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_loadAchievements_callsDataManager() {
        let callsPresenterExpectations = XCTestExpectation(description: "Should call Presenter with didLoadAchievement")
        interactor.loadAchievements()
        XCTAssertTrue(dataManager.loadAchievementsCompletionCalled , "")
        if presenter.didLoadAchievementsCalled {
            callsPresenterExpectations.fulfill()
        }
        wait(for: [callsPresenterExpectations], timeout: 1.0)

    }
    
    func test_loadImage_callsDataManager() {
        let callsPresenterExpectations = XCTestExpectation(description: "Should call Presenter with didLoadImage")
        
        interactor.loadImage(urlString: "url_string", completion: { _ in
            callsPresenterExpectations.fulfill()
        })
        
        XCTAssertTrue(dataManager.loadImageUrlStringCompletionCalled , "Data Manager should  call")
        if presenter.loadImageUrlStringCompletionCalled {
            callsPresenterExpectations.fulfill()
        }
        wait(for: [callsPresenterExpectations], timeout: 1.0)
    }

}
