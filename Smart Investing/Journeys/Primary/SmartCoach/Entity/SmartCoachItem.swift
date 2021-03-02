//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import UIKit

typealias Achievements = [Achievement]

// MARK: - AchievementsList
struct AchievementsList: Codable, Equatable {
    
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: Achievements
    
    static func == (lhs: AchievementsList, rhs: AchievementsList) -> Bool {
        return (lhs.success == rhs.success &&
        lhs.status == rhs.status &&
        lhs.overview == rhs.overview &&
        lhs.achievements == rhs.achievements)
    }
}

// MARK: - Overview
struct Overview: Codable, Equatable {
    let title: String
}


// MARK: - Achievement
class Achievement: Codable, Equatable {
    
    let id: Int
    let level: String
    let progress, total: Int
    let bgImageURL: String
    var bgImage: UIImage?
    let accessible: Bool

    enum CodingKeys: String, CodingKey {
        case id, level, progress, total
        case bgImageURL = "bg_image_url"
        case accessible
    }
    
    static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        lhs.id == rhs.id
    }
}
