//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Rafael Rios on 05/05/25.
//

import XCTest
import EssentialFeed

class SharedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    // MARK: - HELPERS
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
}
