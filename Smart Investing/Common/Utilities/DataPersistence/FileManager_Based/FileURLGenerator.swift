//
//  FileURLGenerator.swift
//  Smart Investing
//
//  Created by Manju Kiran on 27/02/2021.
//

import Foundation

class FileURLGenerator: NSObject {
    
    struct FileNotFoundError: Error {}
    
    func fileUrl(for bundle: Bundle, fileName: String, withExtension fileExtension: String) throws -> URL {
        guard let url = bundle.url(forResource: fileName,
                                              withExtension: fileExtension) else {
            throw FileNotFoundError()
        }
        return url
    }
}
