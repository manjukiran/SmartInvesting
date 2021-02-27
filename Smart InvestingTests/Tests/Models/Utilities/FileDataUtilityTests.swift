//
//  FileDataUtilityTests.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 27/02/2021.
//

import XCTest
@testable import Smart_Investing

class FileDataUtilityTests: XCTestCase {

    var fileUtility: FileDataUtility!
    
    override func setUpWithError() throws {
        self.fileUtility = FileDataUtility()
    }

    override func tearDownWithError() throws {
        self.fileUtility = nil
    }

    func testFileUtilityReturnsValidFileURL() throws {
        guard let url = try? FileURLGenerator().fileUrl(for: Bundle.main,
                                                   fileName: DataFileNameEndpoint.achievements.rawValue,
                                                   withExtension: DataFileNameEndpoint.fileExtension) else {
            XCTFail("Unable to construct URL")
            return
        }
            
        XCTAssertNotNil(try? self.fileUtility.dataFromJSONFile(url: url), "Data For local cached file must not be empty")
    }

}
