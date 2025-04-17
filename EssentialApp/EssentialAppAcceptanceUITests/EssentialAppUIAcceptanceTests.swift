//
//  EssentialAppUIAcceptanceTests.swift
//  EssentialApp
//
//  Created by Rafael Rios on 17/04/25.
//

import XCTest

class EssentialAppUIAcceptanceTests: XCTestCase {
    
    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let app = XCUIApplication()
        
        app.launch()
        
        let feedCells = app.cells.matching(identifier: "feed-image-cell")
        XCTAssertEqual(feedCells.count, 22)
        
        let feedImage = app.cells.matching(identifier: "feed-image-view").firstMatch
        //XCTAssertTrue(feedImage.exists)
    }
}
