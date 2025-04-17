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
        
        XCTAssertEqual(app.cells.count, 22)
        //XCTAssertEqual(app.cells.firstMatch.images.count, 1)
    }
}
