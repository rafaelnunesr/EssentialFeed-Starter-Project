//
//  FeedLoaderStub.swift
//  EssentialApp
//
//  Created by Rafael Rios on 02/04/25.
//

import EssentialFeed

class FeedLoaderStub {
    private let result: Swift.Result<[FeedImage], Error>
    
    init(result: Swift.Result<[FeedImage], Error>) {
        self.result = result
    }
    
    func load(completion: @escaping (Swift.Result<[FeedImage], Error>) -> Void) {
        completion(result)
    }
}
