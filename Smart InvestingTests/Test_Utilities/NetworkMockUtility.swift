//
//  NetworkMockUtility.swift
//  Smart InvestingTests
//
//  Created by Manju Kiran on 27/02/2021.
//

import Foundation
import UIKit
@testable import Smart_Investing

enum NetworkMockUtility {
    
    struct SuccessfulNetworkFetch : URLDataFetching {
        let data: Data
        
        func fetchDataWithURL(url: URL, completionHandler: @escaping dataHandler) {
            completionHandler(.success(data))
        }
        
        func fetchImageDataWithUrl(url: URL, completionHandler: @escaping imageHandler) {
            if let image = UIImage(data: data){
                completionHandler(.success(image))
            }
        }
    }
    
    struct FailedNetworkFetch : URLDataFetching {
        
        func fetchDataWithURL(url: URL, completionHandler: @escaping dataHandler) {
            completionHandler(.failure(DownloadError.serverError))
        }
        func fetchImageDataWithUrl(url: URL, completionHandler: @escaping imageHandler) {
            completionHandler(.failure(ImageError.badImageData))
        }
    }
}
