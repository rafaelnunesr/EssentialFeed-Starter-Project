//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 02/04/25.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
