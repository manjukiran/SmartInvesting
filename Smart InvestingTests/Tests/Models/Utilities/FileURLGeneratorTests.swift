//
//  FileURLGeneratorTests.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 27/02/2021.
//

import XCTest
@testable import Smart_Investing

class FileURLGeneratorTests: XCTestCase {

    var fileUtility: FileURLGenerator!
    
    override func setUpWithError() throws {
        self.fileUtility = FileURLGenerator()
    }

    override func tearDownWithError() throws {
        self.fileUtility = nil
    }

    func testFileUtilityReturnsValidFileURL() throws {
        let endpoint = DataFileNameEndpoint.achievements
        XCTAssertNotNil(try? self.fileUtility.fileUrl(for: Bundle.main,
                                                      fileName: endpoint.urlString(),
                                                      withExtension: endpoint.fileExtension()), "A valid non-nil data endpoint should be returned")
    }


}
