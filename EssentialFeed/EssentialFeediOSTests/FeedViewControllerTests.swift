//
//  FeedViewControllerTests.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 02/02/25.
//

import XCTest

final class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {
        
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    // MARK: - HELPERS
    
    class LoaderSpy {
        private(set) var loadCallCount = 0
    }
}
