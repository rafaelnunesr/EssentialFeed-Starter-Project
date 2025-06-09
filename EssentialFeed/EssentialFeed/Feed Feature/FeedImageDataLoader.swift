//
//  FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 11/02/25.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
