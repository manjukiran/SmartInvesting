//
//  FileDataUtility.swift
//  Smart Investing
//
//  Created by Manju Kiran on 27/02/2021.
//


import Foundation

class FileDataUtility {

    func dataFromJSONFile(url: URL) throws -> Data {
        return try Data(contentsOf: url)
    }
    
}
