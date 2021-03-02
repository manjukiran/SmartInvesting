//
//  DebugLog.swift
//  Smart Investing
//
//  Created by Manju Kiran on 27/02/2021.
//

import Foundation

// Create a generic AutoMockable protocol for Sourcery to pickup and generate mocking code
protocol AutoMockable: class {}

/// Utility to get debug mode to crash the app whilst production apps function with a log.
/// We could instead change the non-debug macro to log data into a logger that can upload information for us instead.
#if DEBUG
func debugLog(_ string: String) {
    print(string)
    // assertionFailure(string)
    /*  ^^ We can instead use assertion failures for debug as the failure becomes more obvious
     *     However, to not let the app crash for the purposes of our interview, I have used print(..args)
    */
}
#else
func debugLog(_ string: String) {
    print(string)
}
#endif

