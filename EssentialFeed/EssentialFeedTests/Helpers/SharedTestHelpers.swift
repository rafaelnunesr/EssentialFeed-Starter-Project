//
//  SharedTestHelpers.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 31/12/24.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
