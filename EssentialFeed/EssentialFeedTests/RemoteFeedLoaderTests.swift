//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Rafael Rios on 03/12/24.
//

import XCTest

final class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPCLientSpy()
        _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_load_requestDataFromURL() {
        let client = HTTPCLientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestURL)
    }
}

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://example.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPCLientSpy: HTTPClient {
    var requestURL: URL?
    
    func get(from url: URL) {
        requestURL = url
    }
}
