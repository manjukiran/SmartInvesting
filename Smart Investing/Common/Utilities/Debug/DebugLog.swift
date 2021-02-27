//
//  DebugLog.swift
//  Smart Investing
//
//  Created by Manju Kiran on 27/02/2021.
//

import Foundation

/// Utility to get debug mode to crash the app whilst production apps function with a log.
/// We could instead change the non-debug macro to log data into a logger that can upload information for us instead.
#if DEBUG
func debugLog(_ string: String) {
    fatalError(string)
}
#else
func debugLog(_ string: String) {
    print(string)
}
#endif

