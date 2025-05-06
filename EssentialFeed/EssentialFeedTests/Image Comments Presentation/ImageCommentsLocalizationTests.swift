//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Rafael Rios on 05/05/25.
//

import XCTest
import EssentialFeed

class ImageCommentsLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: FeedImagePresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
