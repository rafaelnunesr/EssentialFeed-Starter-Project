//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 02/04/25.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
