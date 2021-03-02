//
//  SmartCoachRouterTests.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 01/03/2021.
//

import XCTest
@testable import Smart_Investing

class SmartCoachRouterTests: XCTestCase {
    
    func test_presentSmartCoachModule_creates_smartView_andRelatedComponents() {
        let module = SmartCoachRouter.createSmartCoachModule()
        XCTAssertTrue(module is SmartCoachView)
        XCTAssertNotNil(module.presenter)
        XCTAssertNotNil(module.presenter?.interactor)
        XCTAssertNotNil(module.presenter?.router)
        XCTAssertNotNil(module.presenter?.interactor?.dataManager)
        XCTAssertNotNil(module.presenter?.interactor?.dataManager?.dataManager)
    }


}
