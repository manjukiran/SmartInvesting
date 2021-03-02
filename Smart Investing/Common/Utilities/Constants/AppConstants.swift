//
//  AppConstants.swift
//  Smart Investing
//
//  Created by Manju Kiran on 27/02/2021.
//

import Foundation

enum AppConstants {
    
    /// Theme Color
    public static let themeColorHex = "5D30C2"

    /// Color to indicate that UI element is tappable or indicates previous action (progress // activity)
    public static let actionItemColor = "68C25A" //

    /// URL/Folder String For Fetching JSON Data
    public static let baseURL = ""

    // MARK: - Format Constants

    public enum Formats : String {
        case date = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }

}

// MARK: - URL Constants

/// Individual Endpoints for each URL/File
enum DataFileNameEndpoint : String {
    
    case achievements = "achievements"
    
    /// Returns the full URL String for the requested endpoint
    func urlString() -> String {
        return AppConstants.baseURL + self.rawValue
    }
    
    func fileExtension() -> String{
        ".json"
    }

    
}

// MARK: - Error Constants

/// String ENUMs to help guage the error code based on server response
enum DownloadError: String, Error {
    case badData = "Data is invalid"
    case redirectionError  = "Server Redirection error"
    case clientError = "Client not responding as expected"
    case serverError = "Server Error"
    case invalidRequest = "Request is invalid"
    case unknownError = "Unknown Error"
}

enum ImageError: String, Error {
    case invalidRequest = "Request is invalid"
    case badImageData = "Image Data is invalid"
}

/// Intervals
public enum Intervals : TimeInterval {
    case timeoutInterval  = 30.0
    case imageCacheValidity = 86400.0 /// Image Cache validity - 24 hrs
}
