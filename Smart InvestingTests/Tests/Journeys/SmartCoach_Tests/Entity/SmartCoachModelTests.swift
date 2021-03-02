//
//  SmartCoachModelTests.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 01/03/2021.
//

import XCTest
@testable import Smart_Investing

class SmartCoachModelTests: XCTestCase {
    
    func test_load_single_achievement() throws {
        let achievement = AchievementMockDataGenerator.generateOneAchievement()
        assertRequiredParamsForAchievement(achievement: achievement)
    }
    
    func test_load_all_achievements() throws {
        let achievements = AchievementMockDataGenerator.generateAchievements()
        XCTAssertTrue(achievements.achievements.count == 3)
        let firstObject = achievements.achievements.first
        assertRequiredParamsForAchievement(achievement: firstObject)
    }
    
    private func assertRequiredParamsForAchievement(achievement: Achievement?){
        if let unwrappedAchievement =  achievement {
            XCTAssertTrue(unwrappedAchievement.id == 4)
            XCTAssertTrue(unwrappedAchievement.level == "1")
            XCTAssertTrue(unwrappedAchievement.progress == 10)
            XCTAssertTrue(unwrappedAchievement.total == 50)
            XCTAssertTrue(unwrappedAchievement.bgImageURL == "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png")
            XCTAssertTrue(unwrappedAchievement.accessible)
        } else {
            XCTFail("Achievement object must not be nil")
        }
    }
}
