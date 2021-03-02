//  Smart Investing
//
//  Created by Manju Kiran on 28/02/2021.
//  Copyright © 2021 Manju Kiran. All rights reserved.
//

import Foundation

class SmartCoachDataManager: SmartCoachDataManagerProtocol
{
    private(set) var dataManager: DataSyncManager
    
    required init(dataManager: DataSyncManager){
        self.dataManager  = dataManager
    }
 
    func loadAchievements(completion: @escaping genericDataFetchHandler<AchievementsList>) {
        let achievementsEndPoint = DataFileNameEndpoint.achievements
        guard let url = try? FileURLGenerator().fileUrl(for: Bundle.main,
                                             fileName: achievementsEndPoint.urlString(),
                                             withExtension: achievementsEndPoint.fileExtension()) else {
            completion(.failure(.invalidRequest))
            return
        }
        self.dataManager.retrieveData(url: url, completion: completion)
    }
    
    func loadImage(urlString: String, completion: @escaping imageHandler) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidRequest))
            return
        }
        self.dataManager.retrieveImageData(url: url, completion: completion)
    }
}
