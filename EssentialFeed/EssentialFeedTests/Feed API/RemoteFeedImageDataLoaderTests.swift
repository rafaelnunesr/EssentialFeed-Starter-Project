//
//  RemoteFeedImageDataLoaderTests.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 26/03/25.
//

import XCTest

class RemoteFeedImageDataLoader {
    init(client: Any) {
        
    }
}

class RemoteFeedImageDataLoaderTests: XCTestCase {
    
    func test_init_doesNotPerformAnyURLRequest() {
        let (_, client) = makeSUT()
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    // MARK: - HELPERS
    
    private func makeSUT(url: URL = anyURL()) -> (sut: RemoteFeedImageDataLoader, client: HTTClientSpy) {
        let client = HTTClientSpy()
        let sut = RemoteFeedImageDataLoader(client: client)
        trackForMemoryLeaks(client)
        trackForMemoryLeaks(sut)
        return (sut, client)
    }
    
    private class HTTClientSpy {
        var requestedURLs = [URL]()
    }
}
