//
//  SmartCoachPresenterTests.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 01/03/2021.
//

import XCTest
@testable import Smart_Investing

class SmartCoachPresenterTests: XCTestCase {
    
    var presenter: SmartCoachPresenter!
    
    var interactor = SmartCoachInteractorProtocolMock()
    var router = SmartCoachRouterProtocolMock()
    var view = SmartCoachViewProtocolMock()
    
    override func setUpWithError() throws {
        presenter = SmartCoachPresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
    }
    
    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func test_loadAchievements_calls_interactor() {
        presenter.loadAchievements()
        XCTAssertTrue(interactor.loadAchievementsCalled, "Interactor should be called to load achievements")
    }

    
    func test_loadImage_calls_interactor() {
    
        let loadedExpectation = XCTestExpectation(description: "Should call back completion after loading")
        presenter.loadImage(urlString: "URL_String") { _ in
            loadedExpectation.fulfill()
        }

        XCTAssertTrue(interactor.loadImageUrlStringCompletionCalled, "Interactor should be called to load images")
        wait(for: [loadedExpectation], timeout: 1.0)

    }
    
    func test_presentDetailsForAchievement_calls_router() {
        let achievement = AchievementMockDataGenerator.generateOneAchievement()
        presenter.presentDetailsForAchievement(achievement)
        XCTAssertTrue(router.presentDetailsForAchievementCalled)
        XCTAssertEqual(router.presentDetailsForAchievementReceivedAchievement?.id, achievement.id, "Achievement objects dont match")
    }
    
    
    func test_didLoadAchievements_calls_view() {
        let achievements = AchievementMockDataGenerator.generateAchievements()
        presenter.didLoadAchievements(achievements)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5) { [weak self] in
            guard let self = self else { XCTFail() ; return }
            XCTAssertTrue(self.view.showAchievementsCalled)
            XCTAssertTrue(self.view.showAchievementsCallsCount == 1)
            XCTAssertEqual(self.view.showAchievementsReceivedAchievements, achievements,
                           "Achievement objects dont match")
        }
        wait(for: [], timeout: 3.0)

    }
        
    func test_failedToLoadAchievements_calls_view() {
        let error = DownloadError.unknownError
        presenter.failedToLoadAchievements(with: error)
        XCTAssertTrue(view.showErrorCallsCount == 1)
        XCTAssertTrue(view.showErrorCalled)
        XCTAssertTrue(view.showErrorReceivedError as! DownloadError == error,
                      "Errors objects do not match" )
    }
    
}

