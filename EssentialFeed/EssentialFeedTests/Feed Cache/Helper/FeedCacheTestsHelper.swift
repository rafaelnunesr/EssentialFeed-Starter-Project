//
//  FeedCacheTestsHelper.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 31/12/24.
//

import Foundation
import EssentialFeed

func uniqueImage() -> FeedImage {
    FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    return (models, local)
}

extension Date {
    private var feedCacheMaxAgeInDays: Int {
        return 7
    }
    
    func maxFeedCacheMaxAge() -> Date {
        adding(days: -feedCacheMaxAgeInDays)
    }
    
    func minusFeedCacheMaxAge() -> Date {
        return adding(days: -feedCacheMaxAgeInDays)
    }
}
