//
//  SmartCoachViewTests.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 01/03/2021.
//

import XCTest
@testable import Smart_Investing

class SmartCoachViewTests: XCTestCase {
    
    private var rootViewController: SmartCoachView!
    private var topLevelUIUtilities: TopLevelUIUtilities<SmartCoachView>!
    
    private var presenter = SmartCoachPresenterProtocolMock()
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        rootViewController = SmartCoachView.create()
        rootViewController.presenter = presenter
        topLevelUIUtilities = TopLevelUIUtilities<SmartCoachView>()
        topLevelUIUtilities.setupTopLevelUI(withViewController: rootViewController)
    }
    
    override func tearDownWithError() throws {
        rootViewController = nil
        try? super.tearDownWithError()
    }
    
    func test_setAchievements_updates_collectionView() {
        let achievements = AchievementMockDataGenerator.generateAchievements()
        let collectionView = rootViewController.collectionView
        XCTAssertEqual(collectionView?.numberOfItems(inSection: 0), 1) // Placeholder
        rootViewController.showAchievements(achievements)
        
        let expectation = XCTestExpectation(description: "No of achivements should match number of cells to be returned")
        DispatchQueue.main.async { [weak self] in
            if collectionView?.numberOfItems(inSection: 0) ==  achievements.achievements.count {
                expectation.fulfill()
            }
            self?.wait(for: [expectation], timeout: 2.0)
        }
        
    }
    
    func test_setAchievements_updates_collectionView_cell_return() {
        let achievements = AchievementMockDataGenerator.generateAchievements()
        let collectionView = rootViewController.collectionView
        rootViewController.showAchievements(achievements)
        let expectation = XCTestExpectation(description: "Cells type must be to be AchievementViewCell")
        DispatchQueue.main.async { [weak self] in
            if let cell = collectionView?.cellForItem(at: IndexPath(item: 0, section: 0)) as? AchievementViewCell {
                let firstAchievement = achievements.achievements.first!
                XCTAssertNotNil(cell.levelIndicator.attributedText)
                XCTAssertTrue(cell.progressBar.progress ==  Float(firstAchievement.progress) / Float( firstAchievement.total))
                XCTAssertTrue(cell.currentProgress.text == "\(firstAchievement.progress) pts")
                XCTAssertTrue(cell.totalProgress.text == "\(firstAchievement.total) pts")
                XCTAssertTrue(cell.inaccessibilityLayer.isHidden == false)
                expectation.fulfill()
            }
            self?.wait(for: [expectation], timeout: 1.0)
        }
    }
    
}
