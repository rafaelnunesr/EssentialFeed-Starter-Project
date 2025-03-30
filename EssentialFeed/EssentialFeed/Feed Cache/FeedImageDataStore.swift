//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 30/03/25.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
