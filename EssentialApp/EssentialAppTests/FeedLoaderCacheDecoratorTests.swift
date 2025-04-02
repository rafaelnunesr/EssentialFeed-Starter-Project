//
//  FeedLoaderCacheDecoratorTests.swift
//  EssentialApp
//
//  Created by Rafael Rios on 02/04/25.
//

import XCTest
import EssentialFeed

final class FeedLoaderCacheDecorator: FeedLoader {
    private let decoratee: FeedLoader
    
    init(decoratte loader: FeedLoader) {
        self.decoratee = loader
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decoratee.load(completion: completion)
    }
}

class FeedLoaderCacheDecoratorTests: XCTestCase, FeedLoaderTestCase {
    
    func test_load_deliversFeedOnLoaderSuccess() {
        let feed = uniqueFeed()
        let loader = FeedLoaderStub(result: .success(feed))
        let sut = FeedLoaderCacheDecorator(decoratte: loader)
        
        expect(sut, toCompleteWith: .success(feed))
    }
    
    func test_deliversErrorOnLoaderFailure() {
        let loader = FeedLoaderStub(result: .failure(anyNSError()))
        let sut = FeedLoaderCacheDecorator(decoratte: loader)
        
        expect(sut, toCompleteWith: .failure(anyNSError()))
    }
}
