//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Rafael Rios on 03/12/24.
//

import XCTest

final class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://example.com")!
        let client = HTTPCLientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_load_requestDataFromURL() {
        let url = URL(string: "https://example.com")!
        let client = HTTPCLientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        sut.load()
        
        XCTAssertEqual(client.requestURL, url)
    }
}

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
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
