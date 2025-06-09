//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 02/04/25.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
