//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 30/03/25.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
