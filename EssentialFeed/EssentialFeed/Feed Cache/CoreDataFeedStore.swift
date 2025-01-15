//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 15/01/25.
//

import Foundation

public class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
}
