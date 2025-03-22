//
//  FeedPresenterTests.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 22/03/25.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - HELPERS
    
    private class ViewSpy {
        let messages = [Any]()
    }
}
